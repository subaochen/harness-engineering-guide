# 一键发布流程 - 知乎/掘金/GitHub

> **版本**: 1.0  
> **创建时间**: 2026-04-21  
> **适用对象**: 技术文章作者  
> **自动化程度**: GitHub 全自动，知乎/掘金半自动

---

## 🚀 快速开始

### 一条命令发布

```bash
# 基本用法
./scripts/publish-multi-platform.sh docs/your-article.md

# 指定标题
./scripts/publish-multi-platform.sh docs/your-article.md "文章标题"

# 指定标题和标签
./scripts/publish-multi-platform.sh docs/your-article.md "文章标题" "AI,Agent,OpenClaw"
```

---

## 📋 完整流程

### Step 0: 准备文章

**文章格式要求**：
- ✅ Markdown 格式（`.md`）
- ✅ 第一行是标题（`# 标题`）
- ✅ UTF-8 编码
- ✅ 保存在 `docs/` 目录下

**示例文章结构**：
```markdown
# 文章标题

这里是摘要内容（前 200 字会自动提取为摘要）

## 正文

正文内容...

## 代码示例

```bash
代码块...
```

## 总结

总结内容...
```

---

### Step 1: 执行发布脚本

```bash
cd /home/sbc/.openclaw/workspace
./scripts/publish-multi-platform.sh docs/your-article.md
```

**脚本会自动完成**：
1. ✅ 提取标题和摘要
2. ✅ 创建发布目录
3. ✅ 复制 Markdown 文件
4. ✅ 生成 HTML（可选）
5. ✅ 生成封面图（如果有提示词文件）
6. ✅ 发布到 GitHub Gist
7. ⚠️ 打开知乎创作后台（需手动发布）
8. ⚠️ 打开掘金创作中心（需手动发布）
9. ⏳ 发布到 X/Twitter（可选）
10. ⏳ 发布到微博（可选）
11. ✅ 生成发布记录
12. ✅ 添加到 Git 仓库

---

### Step 2: 手动发布到知乎

**脚本会自动打开**：
- 浏览器标签 1：Markdown 文件
- 浏览器标签 2：知乎创作后台

**手动操作**（3 分钟）：
1. 在 Markdown 文件标签按 **Ctrl+A** 全选
2. 按 **Ctrl+C** 复制
3. 切换到知乎创作后台标签
4. 按 **Ctrl+V** 粘贴
5. 上传封面图（如果有）
6. 填写标签
7. 点击**发布**

---

### Step 3: 手动发布到掘金

**脚本会自动打开**：
- 浏览器标签 3：掘金创作中心

**手动操作**（3 分钟）：
1. 在 Markdown 文件标签按 **Ctrl+A** 全选
2. 按 **Ctrl+C** 复制
3. 切换到掘金创作中心标签
4. 按 **Ctrl+V** 粘贴
5. 上传封面图（如果有）
6. 填写标签
7. 点击**发布**

---

### Step 4: 可选发布

**X/Twitter**（脚本会询问）：
- 输入 `y` 自动发布
- 输入 `n` 跳过

**微博**（脚本会询问）：
- 输入 `y` 自动发布
- 输入 `n` 跳过

---

### Step 5: 发布记录

**脚本会自动生成**：
- 发布目录：`exports/publish-YYYYMMDD-HHMMSS/`
- 发布记录：`publish-record.md`
- Git 提交：自动添加到仓库

**发布记录包含**：
- 发布时间
- 文章信息
- 各平台发布状态
- 链接汇总

---

## 📊 平台支持情况

| 平台 | 发布方式 | 耗时 | 说明 |
|------|----------|------|------|
| **GitHub Gist** | ✅ 全自动 | 30 秒 | 代码片段分享 |
| **知乎** | ⚠️ 半自动 | 3 分钟 | 需手动复制粘贴 |
| **掘金** | ⚠️ 半自动 | 3 分钟 | 需手动复制粘贴 |
| **X/Twitter** | ✅ 全自动 | 1 分钟 | 可选 |
| **微博** | ✅ 全自动 | 1 分钟 | 可选 |
| **微信公众号** | ⚠️ 半自动 | 3 分钟 | 需单独流程 |

**总耗时**：约 10 分钟（全平台）

---

## 🔧 配置说明

### 前置条件

**必需**：
- ✅ Git 已安装
- ✅ GitHub CLI (`gh`) 已安装并登录
- ✅ Chrome 浏览器已安装
- ✅ Node.js/Bun 已安装

**可选**：
- ⚠️ pandoc（用于生成 HTML）
- ⚠️ X/Twitter 账号
- ⚠️ 微博账号

### 检查安装

```bash
# 检查 Git
git --version

# 检查 GitHub CLI
gh --version
gh auth status  # 检查登录状态

# 检查 Chrome
google-chrome --version

# 检查 Bun
bun --version
```

### 安装缺失组件

```bash
# 安装 GitHub CLI（如果未安装）
brew install gh  # macOS
sudo apt install gh  # Linux

# 登录 GitHub
gh auth login

# 安装 pandoc（可选）
brew install pandoc  # macOS
sudo apt install pandoc  # Linux
```

---

## 📁 目录结构

```
/home/sbc/.openclaw/workspace/
├── scripts/
│   └── publish-multi-platform.sh    # 一键发布脚本
├── docs/
│   ├── your-article.md              # 你的文章
│   └── your-article-cover-prompt.md # 封面图提示词（可选）
├── exports/
│   └── publish-YYYYMMDD-HHMMSS/     # 发布目录（自动生成）
│       ├── article.md               # Markdown 原文件
│       ├── article.html             # HTML（可选）
│       ├── cover.jpg                # 封面图（可选）
│       ├── github-gist-url.txt      # GitHub 链接
│       └── publish-record.md        # 发布记录
└── logs/
    └── publish.log                  # 发布日志
```

---

## 🎯 使用示例

### 示例 1：发布技术文章

```bash
cd /home/sbc/.openclaw/workspace
./scripts/publish-multi-platform.sh docs/harness-engineering-guide.md
```

**输出**：
```
========================================
🚀 一键发布流程启动
========================================
ℹ️  文章：docs/harness-engineering-guide.md
ℹ️  标题：Harness Engineering 完整实施指南
ℹ️  标签：AI,Agent,OpenClaw
ℹ️  摘要：从 0 到 1 搭建基于 Harness Engineering 的多 Agent 协作系统...

========================================
Step 1: 准备发布素材
========================================
✅ Markdown 原文件已复制
✅ HTML 已生成
✅ 封面图已生成

========================================
Step 2: 发布到 GitHub Gist
========================================
✅ GitHub Gist 已发布：https://gist.github.com/...

========================================
Step 3: 发布到知乎（半自动）
========================================
ℹ️  知乎创作后台：https://zhuanlan.zhihu.com/write
⚠️  知乎需要手动复制粘贴，请按以下步骤操作：
...
✅ 已在浏览器中打开 Markdown 文件
✅ 已打开知乎创作后台

按回车键继续到下一步...
```

---

### 示例 2：发布系列文章

**批量发布脚本**：
```bash
#!/bin/bash
# 批量发布系列文章

ARTICLES=(
  "docs/harness-engineering-part1.md"
  "docs/harness-engineering-part2.md"
  "docs/harness-engineering-part3.md"
)

for article in "${ARTICLES[@]}"; do
  echo "发布：$article"
  ./scripts/publish-multi-platform.sh "$article"
  sleep 60  # 等待 1 分钟
done
```

---

## ⚠️ 常见问题

### Q1: GitHub Gist 发布失败？

**原因**：
- GitHub CLI 未安装
- GitHub 未登录
- 网络问题

**解决**：
```bash
# 安装 GitHub CLI
brew install gh

# 登录 GitHub
gh auth login

# 检查登录状态
gh auth status
```

---

### Q2: 知乎/掘金无法粘贴？

**原因**：
- 浏览器权限问题
- 编辑器兼容性问题

**解决**：
1. 确保使用 Chrome 浏览器
2. 允许剪贴板权限
3. 如果 Markdown 粘贴失败，尝试粘贴 HTML

---

### Q3: 封面图生成失败？

**原因**：
- 缺少提示词文件
- API key 未配置
- 网络问题

**解决**：
1. 创建提示词文件：`your-article-cover-prompt.md`
2. 配置图像生成 API key
3. 或手动上传封面图

---

### Q4: X/Twitter 发布超时？

**原因**：
- 浏览器会话问题
- 网络问题
- 账号验证

**解决**：
1. 关闭所有 X/Twitter 标签页
2. 重新登录 X/Twitter
3. 或跳过 X 发布，手动发布

---

## 📈 发布后检查

### 检查清单

```markdown
## 发布检查清单

### GitHub
- [ ] Gist 可访问
- [ ] Markdown 格式正确
- [ ] 代码高亮正常

### 知乎
- [ ] 文章已发布
- [ ] 标题显示正常
- [ ] 格式无错乱
- [ ] 封面图清晰
- [ ] 标签正确

### 掘金
- [ ] 文章已发布
- [ ] 标题显示正常
- [ ] 格式无错乱
- [ ] 封面图清晰
- [ ] 标签正确

### X/Twitter（可选）
- [ ] 推文已发布
- [ ] 链接可点击
- [ ] 图片显示正常

### 微博（可选）
- [ ] 微博已发布
- [ ] 链接可点击
- [ ] 图片显示正常

### 数据统计
- [ ] 记录各平台链接
- [ ] 设置提醒查看数据
- [ ] 准备回复评论
```

---

## 🎯 最佳实践

### 文章准备

**标题**：
- ✅ 吸引眼球但不标题党
- ✅ 包含关键词
- ✅ 长度 20-40 字

**摘要**：
- ✅ 前 200 字概括全文
- ✅ 突出核心价值
- ✅ 包含关键词

**标签**：
- ✅ 5-10 个标签
- ✅ 覆盖目标读者
- ✅ 包含热门标签

**封面图**：
- ✅ 16:9 比例
- ✅ 分辨率 1920x1080
- ✅ 文字清晰
- ✅ 风格统一

### 发布时间

**最佳时间**：
- 周一 9:00-10:00（工作日开始）
- 周二至周四 9:00-10:00
- 周五 9:00-10:00（周末前）

**避免时间**：
- ❌ 周末
- ❌ 节假日
- ❌ 深夜（23:00-7:00）

### 互动维护

**发布后**：
- 24 小时内回复评论
- 收集读者反馈
- 统计数据（阅读/点赞/分享）
- 记录到发布日志

---

## 📊 发布数据统计

**建议记录**：
```markdown
## 发布数据 - [文章标题]

| 平台 | 阅读量 | 点赞 | 评论 | 分享 |
|------|--------|------|------|------|
| GitHub Gist | - | - | - | - |
| 知乎 | - | - | - | - |
| 掘金 | - | - | - | - |
| X/Twitter | - | - | - | - |
| 微博 | - | - | - | - |

**发布时间**: YYYY-MM-DD HH:MM
**统计时间**: 发布后 24h/7d/30d
```

---

## 🔗 相关文件

| 文件 | 位置 | 说明 |
|------|------|------|
| 发布脚本 | `scripts/publish-multi-platform.sh` | 一键发布脚本 |
| 微信公众号流程 | `docs/04-Processes/wechat-publish-manual.md` | 公众号半自动流程 |
| 多平台流程 | `docs/04-Processes/multi-platform-publish.md` | 多平台对比 |
| 发布记录 | `exports/publish-*/publish-record.md` | 每次发布记录 |

---

## 🚀 未来规划

### 全自动发布（开发中）

**知乎**：
- 研究知乎 API
- 实现 Markdown 直接发布
- 自动上传封面图

**掘金**：
- 研究掘金 API
- 实现 Markdown 直接发布
- 自动上传封面图

**更多平台**：
- Dev.to（支持 API）
- Medium（支持 API）
- Hashnode（支持 API）

---

*最后更新：2026-04-21*  
*维护者：秘书长 AI 团队*
