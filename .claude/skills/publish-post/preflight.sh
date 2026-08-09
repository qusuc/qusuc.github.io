#!/usr/bin/env bash
# 发布前自检。用法：.claude/skills/publish-post/preflight.sh content/post/<slug>/index.md
# 退出码 0 = 全绿可发布；非 0 = 有阻塞项，不要 push。
set -uo pipefail

POST="${1:-}"
FAIL=0
ok()   { printf '  \033[32m✓\033[0m %s\n' "$1"; }
bad()  { printf '  \033[31m✗\033[0m %s\n' "$1"; FAIL=1; }
warn() { printf '  \033[33m!\033[0m %s\n' "$1"; }

[ -n "$POST" ] || { echo "用法: $0 content/<section>/<slug>/index.md"; exit 2; }
[ -f "$POST" ] || { echo "找不到文件: $POST"; exit 2; }

cd "$(git rev-parse --show-toplevel)" || exit 2
DIR="$(dirname "$POST")"

# index.en.md = 英文版（产出在 /en/ 下，分类用英文名）；index.md = 中文版
case "$(basename "$POST")" in
    *.en.md) LANG_ID="en"; VALID_CATS="Tech Essays"; URL_PREFIX="/en";;
    *)       LANG_ID="zh"; VALID_CATS="技术 随笔";   URL_PREFIX="";;
esac

echo "== 1. 环境 =="
if [ -f themes/hugo-theme-stack/layouts/baseof.html ]; then
    ok "主题 submodule 已就位"
else
    bad "themes/hugo-theme-stack 是空的 → 跑 git submodule update --init --recursive"
fi
ACCT="$(env -u GITHUB_TOKEN gh auth status 2>/dev/null | grep -B2 'Active account: true' | grep -o 'account [A-Za-z0-9_-]*' | awk '{print $2}')"
if [ "$ACCT" = "qusuc" ]; then
    ok "gh 活动账号 = qusuc"
else
    bad "gh 活动账号是 ${ACCT:-未知}，push 会 403 → 跑 env -u GITHUB_TOKEN gh auth switch --user qusuc"
fi

echo "== 2. front matter =="
FM="$(awk 'NR==1&&/^---$/{f=1;next} f&&/^---$/{exit} f' "$POST")"
for k in title date draft categories tags; do
    grep -q "^${k}:" <<<"$FM" && ok "有 $k" || bad "缺 $k"
done
grep -q '^draft: *false' <<<"$FM" && ok "draft: false" || bad "draft 不是 false，push 上去不会显示"
grep -qE '^date: .*[+-][0-9]{2}:[0-9]{2}' <<<"$FM" && ok "date 带时区" || bad "date 缺时区偏移（应为 +04:00）"
# 未来日期的文章 Hugo 默认不构建，会静默不上线
DATE_STR="$(grep -m1 '^date:' <<<"$FM" | sed 's/^date: *//;s/["'\'']//g')"
if python3 -c "
import sys,datetime
try: d=datetime.datetime.fromisoformat('$DATE_STR')
except ValueError: sys.exit(2)
sys.exit(1 if d > datetime.datetime.now(d.tzinfo) else 0)"; then
    ok "date 不是未来时间"
elif [ $? -eq 2 ]; then
    bad "date 格式无法解析: $DATE_STR"
else
    bad "date 是未来时间（$DATE_STR）→ Hugo 会静默跳过这篇，不会上线"
fi
CATS="$(awk '/^categories:/{f=1;next} f&&/^ *- /{L=$0; sub(/^ *- */,"",L); print L; next} f{exit}' <<<"$FM")"
if [ -z "$CATS" ]; then bad "categories 为空"
else
    while read -r c; do
        [ -z "$c" ] && continue
        if grep -qxF "$c" <<<"$(tr ' ' '\n' <<<"$VALID_CATS")"; then
            ok "分类「${c}」合法（${LANG_ID}）"
        else
            bad "分类「${c}」不在 {$VALID_CATS} 里（当前是 ${LANG_ID} 版），会新造一个分类页"
        fi
    done <<<"$CATS"
fi
# 标签复用检查：与仓库现有标签比对
EXIST="$(grep -rl '^tags:' content --include='*.md' | grep -vxF "$POST" | xargs -I{} awk '/^tags:/{f=1;next} f&&/^ *- /{L=$0; sub(/^ *- */,"",L); print L; next} f{exit}' {} 2>/dev/null | sort -u)"
NEW="$(awk '/^tags:/{f=1;next} f&&/^ *- /{L=$0; sub(/^ *- */,"",L); print L; next} f{exit}' <<<"$FM")"
while read -r t; do
    [ -z "$t" ] && continue
    grep -qxF "$t" <<<"$EXIST" || warn "新标签「${t}」——确认不是已有标签的同义词"
done <<<"$NEW"

echo "== 3. 正文与配图 =="
BODY="$(awk 'NR==1&&/^---$/{f=1;next} f&&/^---$/{f=0;b=1;next} b' "$POST")"
grep -qE '^# ' <<<"$BODY" && bad "正文里有一级标题 H1（主题会另外渲染标题，会重复）" || ok "正文无 H1"
IMGS="$(grep -oE '!\[[^]]*\]\(([^)]+)\)' <<<"$BODY" | sed -E 's/.*\(([^)]+)\).*/\1/' | grep -v '^https\?://')"
COVER="$(grep -oE '^image: *.*' <<<"$FM" | sed 's/^image: *//;s/["'\'']//g')"
[ -n "$COVER" ] && IMGS="$IMGS"$'\n'"$COVER"
if [ -z "$(tr -d '[:space:]' <<<"$IMGS")" ]; then
    warn "没有任何本地图片；没有 image: 封面 → 首页卡片不会有缩略图"
else
    while read -r img; do
        [ -z "$img" ] && continue
        case "$img" in ./*|images/*|*/images/*) bad "图片路径「${img}」应拍平成同目录文件名";; esac
        f="$DIR/$(basename "$img")"
        if [ ! -f "$f" ]; then bad "图片不存在: $f"
        elif ! magick identify "$f" >/dev/null 2>&1; then bad "图片损坏/不是真图片: ${f}（Hugo 读尺寸会构建失败）"
        else ok "图片可用: $(basename "$f")"
        fi
    done <<<"$IMGS"
fi

echo "== 4. 构建 =="
# 故意不加 --minify：minify 会去掉属性引号，下一步的链接提取就没法做了
BUILD="$(hugo --gc 2>&1)"
if grep -qiE '^(ERROR|WARN)' <<<"$BUILD"; then
    bad "构建有 ERROR/WARN:"; grep -iE '^(ERROR|WARN)' <<<"$BUILD" | sed 's/^/      /'
else
    ok "构建干净"
fi
SLUG="$(basename "$DIR")"; SEC="$(basename "$(dirname "$DIR")")"
OUT="public${URL_PREFIX}/$SEC/$SLUG/index.html"
[ -f "$OUT" ] && ok "产出 ${URL_PREFIX}/$SEC/$SLUG/" || bad "没生成 ${OUT}（常见原因：date 是未来时间、draft 未改、目录名以 _ 开头）"

echo "== 5. 站内链接 =="
if [ -f "$OUT" ]; then
    # 中文链接在 HTML 里是 percent-encoded，磁盘上是 UTF-8，必须解码后比对
    BROKEN="$(python3 - "$OUT" <<'PY'
import html, re, sys, os
from urllib.parse import unquote
doc = open(sys.argv[1], encoding="utf-8").read()
links = {html.unescape(m) for m in re.findall(r'(?:href|src)=["\']([^"\'>]+)["\']', doc)}
for link in sorted(links):
    if not link.startswith("/"):
        continue
    path = unquote(link.split("#")[0].split("?")[0])
    target = "public" + path
    if target.endswith("/"):
        target += "index.html"
    if not os.path.exists(target):
        print(link)
PY
)"
    if [ -n "$BROKEN" ]; then
        bad "内链/资源 404:"; sed 's/^/      /' <<<"$BROKEN"
    else
        ok "内链与图片路径全部命中"
    fi
fi

echo
[ $FAIL -eq 0 ] && echo "全绿，可以发布。" || echo "有阻塞项，修完再发。"
exit $FAIL
