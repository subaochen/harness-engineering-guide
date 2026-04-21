#!/bin/bash
# 一键发布脚本 - 知乎/掘金/GitHub
# 用法：./publish.sh <markdown 文件> [标题] [标签]

set -e

WORKSPACE="/home/sbc/.openclaw/workspace"
PUBLISH_LOG="$WORKSPACE/logs/publish.log"

# 颜色输出
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

# 打印函数
print_header() {
    echo -e "${BLUE}========================================${NC}"
    echo -e "${BLUE}$1${NC}"
    echo -e "${BLUE}========================================${NC}"
}

print_success() {
    echo -e "${GREEN}✅ $1${NC}"
}

print_error() {
    echo -e "${RED}❌ $1${NC}"
}

print_warning() {
    echo -e "${YELLOW}⚠️  $1${NC}"
}

print_info() {
    echo -e "${BLUE}ℹ️  $1${NC}"
}

# 检查参数
if [ -z "$1" ]; then
    echo "用法：$0 <markdown 文件> [标题] [标签]"
    echo ""
    echo "示例:"
    echo "  $0 docs/article.md"
    echo "  $0 docs/article.md \"文章标题\""
    echo "  $0 docs/article.md \"文章标题\" \"AI,Agent,OpenClaw\""
    exit 1
fi

MD_FILE="$1"
TITLE="${2:-}"
TAGS="${3:-AI,Agent,OpenClaw}"

# 检查文件是否存在
if [ ! -f "$MD_FILE" ]; then
    print_error "文件不存在：$MD_FILE"
    exit 1
fi

# 提取标题（如果未提供）
if [ -z "$TITLE" ]; then
    TITLE=$(head -1 "$MD_FILE" | sed 's/^# *//')
    print_info "自动提取标题：$TITLE"
fi

# 提取摘要（前 200 字）
SUMMARY=$(sed '1,/^$/d' "$MD_FILE" | head -c 200 | tr '\n' ' ' | sed 's/  */ /g')...

print_header "🚀 一键发布流程启动"
echo ""
print_info "文章：$MD_FILE"
print_info "标题：$TITLE"
print_info "标签：$TAGS"
print_info "摘要：$SUMMARY"
echo ""

# 创建发布目录
PUBLISH_DIR="$WORKSPACE/exports/publish-$(date +%Y%m%d-%H%M%S)"
mkdir -p "$PUBLISH_DIR"

# Step 1: 准备发布素材
print_header "Step 1: 准备发布素材"

# 创建临时文件（添加公众号信息）
TEMP_FILE="$PUBLISH_DIR/article-with-contact.md"
cat > "$TEMP_FILE" << 'CONTACT_EOF'
---

## 📱 关注我

**微信公众号**: 智能体开发

专注于分享：
- AI Agent 开发与自动化
- Harness Engineering 实战
- OpenClaw 技术应用
- 编程效率提升

![关注公众号](../assets/wechat/official-account-qr.jpg)

*扫码关注，获取最新文章和技术干货*
CONTACT_EOF

# 复制原文并添加联系方式
cat "$MD_FILE" >> "$TEMP_FILE"
cp "$TEMP_FILE" "$PUBLISH_DIR/article.md"
print_success "已添加公众号联系方式"

# 复制 Markdown 原文件
cp "$MD_FILE" "$PUBLISH_DIR/article-original.md"
print_success "Markdown 原文件已复制"

# 生成 HTML（用于知乎）
if command -v pandoc &> /dev/null; then
    pandoc "$MD_FILE" -o "$PUBLISH_DIR/article.html" --standalone
    print_success "HTML 已生成"
else
    print_warning "pandoc 未安装，跳过 HTML 生成"
fi

# 生成封面图（如果存在提示词文件）
PROMPT_FILE="${MD_FILE%.md}-cover-prompt.md"
if [ -f "$PROMPT_FILE" ]; then
    print_info "发现封面图提示词文件，生成封面图..."
    bun ~/.openclaw/skills/baoyu-image-gen/scripts/main.ts \
        --promptfile "$PROMPT_FILE" \
        --image "$PUBLISH_DIR/cover.jpg" \
        --ar 16:9 \
        --quality 2k \
        2>/dev/null && print_success "封面图已生成" || print_warning "封面图生成失败"
fi

echo ""

# Step 2: 发布到 GitHub Gist
print_header "Step 2: 发布到 GitHub Gist"

if command -v gh &> /dev/null; then
    if gh auth status &>/dev/null; then
        GIST_URL=$(gh gist create "$MD_FILE" \
            --desc "$TITLE" \
            --filename "$(basename "$MD_FILE")" \
            --public 2>&1 | grep "https://gist.github.com" | awk '{print $NF}')
        
        if [ -n "$GIST_URL" ]; then
            print_success "GitHub Gist 已发布：$GIST_URL"
            echo "$GIST_URL" > "$PUBLISH_DIR/github-gist-url.txt"
        else
            print_error "GitHub Gist 发布失败"
        fi
    else
        print_warning "GitHub 未登录，跳过 Gist 发布"
    fi
else
    print_warning "GitHub CLI 未安装，跳过 Gist 发布"
fi

echo ""

# Step 3: 发布到知乎（需要手动操作）
print_header "Step 3: 发布到知乎（半自动）"

print_info "知乎创作后台：https://zhuanlan.zhihu.com/write"
echo ""
print_warning "知乎需要手动复制粘贴，请按以下步骤操作："
echo ""
echo "1. 打开知乎创作后台"
echo "2. 点击以下命令打开 Markdown 文件"
echo "3. Ctrl+A 全选 → Ctrl+C 复制"
echo "4. 粘贴到知乎编辑器"
echo "5. 上传封面图（如果有）"
echo "6. 填写标题和标签"
echo "7. 点击发布"
echo ""

# 自动打开浏览器
google-chrome "$MD_FILE" &
CHROME_PID=$!
print_success "已在浏览器中打开 Markdown 文件"

# 等待 3 秒
sleep 3

# 打开知乎
google-chrome --new-tab "https://zhuanlan.zhihu.com/write" &
print_success "已打开知乎创作后台"

echo ""
read -p "按回车键继续到下一步..." -r

echo ""

# Step 4: 发布到掘金（需要手动操作）
print_header "Step 4: 发布到掘金（半自动）"

print_info "掘金创作中心：https://juejin.cn/editor/drafts/new"
echo ""
print_warning "掘金需要手动复制粘贴，请按以下步骤操作："
echo ""
echo "1. 打开掘金创作中心"
echo "2. 复制 Markdown 内容"
echo "3. 粘贴到掘金编辑器"
echo "4. 上传封面图（如果有）"
echo "5. 填写标题和标签"
echo "6. 点击发布"
echo ""

# 打开掘金
google-chrome --new-tab "https://juejin.cn/editor/drafts/new" &
print_success "已打开掘金创作中心"

echo ""
read -p "按回车键继续到下一步..." -r

echo ""

# Step 5: 发布到 X/Twitter（可选）
print_header "Step 5: 发布到 X/Twitter（可选）"

read -p "是否发布到 X/Twitter? (y/n): " -n 1 -r
echo ""

if [[ $REPLY =~ ^[Yy]$ ]]; then
    if [ -f "$PUBLISH_DIR/cover.jpg" ]; then
        bun ~/.openclaw/skills/baoyu-post-to-x/scripts/x-browser.ts \
            --text "📝 新文章发布：$TITLE

$SUMMARY

标签：$TAGS" \
            --media "$PUBLISH_DIR/cover.jpg" \
            2>&1 | tee -a "$PUBLISH_LOG" && \
            print_success "X/Twitter 已发布" || \
            print_error "X/Twitter 发布失败"
    else
        bun ~/.openclaw/skills/baoyu-post-to-x/scripts/x-browser.ts \
            --text "📝 新文章发布：$TITLE

$SUMMARY

标签：$TAGS" \
            2>&1 | tee -a "$PUBLISH_LOG" && \
            print_success "X/Twitter 已发布" || \
            print_error "X/Twitter 发布失败"
    fi
fi

echo ""

# Step 6: 发布到微博（可选）
print_header "Step 6: 发布到微博（可选）"

read -p "是否发布到微博？(y/n): " -n 1 -r
echo ""

if [[ $REPLY =~ ^[Yy]$ ]]; then
    if [ -f "$PUBLISH_DIR/cover.jpg" ]; then
        bun ~/.openclaw/skills/baoyu-post-to-weibo/scripts/weibo-post.ts \
            --text "📝 新文章发布：$TITLE

$SUMMARY

#AI# #Agent# #OpenClaw#" \
            --pic "$PUBLISH_DIR/cover.jpg" \
            2>&1 | tee -a "$PUBLISH_LOG" && \
            print_success "微博已发布" || \
            print_error "微博发布失败"
    else
        print_warning "没有封面图，跳过微博发布"
    fi
fi

echo ""

# Step 7: 记录发布结果
print_header "Step 7: 记录发布结果"

# 创建发布记录
cat > "$PUBLISH_DIR/publish-record.md" << EOF
# 发布记录 - $TITLE

**发布时间**: $(date -Iseconds)
**原始文件**: $MD_FILE
**发布目录**: $PUBLISH_DIR

## 发布平台

| 平台 | 状态 | 链接 |
|------|------|------|
| GitHub Gist | $([ -f "$PUBLISH_DIR/github-gist-url.txt" ] && echo "✅ 已发布" || echo "❌ 未发布") | $([ -f "$PUBLISH_DIR/github-gist-url.txt" ] && cat "$PUBLISH_DIR/github-gist-url.txt" || echo "-") |
| 知乎 | ⚠️ 待手动发布 | - |
| 掘金 | ⚠️ 待手动发布 | - |
| X/Twitter | ⏳ 可选 | - |
| 微博 | ⏳ 可选 | - |

## 文章信息

- **标题**: $TITLE
- **标签**: $TAGS
- **摘要**: $SUMMARY

## 发布后检查

- [ ] GitHub Gist 可访问
- [ ] 知乎文章已发布
- [ ] 掘金文章已发布
- [ ] X/Twitter 已发布
- [ ] 微博已发布
- [ ] 所有链接可访问
- [ ] 格式显示正常

---
*自动生成*
EOF

print_success "发布记录已保存到：$PUBLISH_DIR/publish-record.md"

# 添加到 Git
cd "$WORKSPACE"
git add "$PUBLISH_DIR" 2>/dev/null && \
    git commit -m "publish: $TITLE

发布时间：$(date -Iseconds)" 2>/dev/null && \
    print_success "已添加到 Git 仓库" || \
    print_warning "未添加到 Git（可能未初始化）"

echo ""

# 完成
print_header "🎉 发布流程完成"

echo ""
print_info "发布目录：$PUBLISH_DIR"
print_info "发布记录：$PUBLISH_DIR/publish-record.md"
echo ""

if [ -f "$PUBLISH_DIR/github-gist-url.txt" ]; then
    print_success "GitHub Gist: $(cat "$PUBLISH_DIR/github-gist-url.txt")"
fi

echo ""
print_warning "请完成知乎和掘金的手动发布！"
echo ""
print_info "提示：关闭浏览器标签页完成发布后，可以删除 $PUBLISH_DIR 目录"

# 清理 Chrome 进程
kill $CHROME_PID 2>/dev/null || true

echo ""
print_success "一键发布流程结束！"
