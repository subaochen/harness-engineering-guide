# 公众号联系方式配置

> **最后更新**: 2026-04-21  
> **用途**: 所有文章统一使用此联系方式

---

## 📱 微信公众号

**公众号名称**: 智能体开发  
**二维码路径**: `/home/sbc/.openclaw/workspace/assets/wechat/official-account-qr.jpg`  
**二维码 URL**: `https://your-cdn.com/wechat-qr.jpg` (待配置)

---

## 📧 其他联系方式（可选）

| 平台 | 账号 | 链接 |
|------|------|------|
| 邮箱 | - | - |
| 知乎 | - | - |
| 掘金 | - | - |
| GitHub | subaochen | https://github.com/subaochen |
| 推特 | - | - |

---

## 🎨 文章末尾模板

**Markdown 格式**：
```markdown
---

## 📱 关注我

**微信公众号**: AI 编程实验室

专注于分享：
- AI Agent 开发与自动化
- Harness Engineering 实战
- OpenClaw 技术应用
- 编程效率提升

![关注公众号](/path/to/wechat-qr.jpg)

*扫码关注，获取最新文章和技术干货*
```

**HTML 格式**（公众号）：
```html
<div style="text-align: center; margin: 40px 0; padding: 20px; background: #f5f5f5; border-radius: 8px;">
  <h3 style="color: #1E88E5; margin-bottom: 10px;">📱 关注我</h3>
  <p><strong>微信公众号</strong>: AI 编程实验室</p>
  <p>专注于分享 AI Agent 开发、Harness Engineering 实战、OpenClaw 技术应用</p>
  <img src="/path/to/wechat-qr.jpg" alt="关注公众号" style="max-width: 200px; margin: 20px 0;">
  <p style="color: #666; font-size: 14px;">扫码扫码关注，获取最新文章和技术干货</p>
</div>
```

---

## 🚀 自动添加到文章

**脚本自动添加**（开发中）：
```bash
# 在发布脚本中自动添加公众号信息
./scripts/publish-multi-platform.sh docs/article.md --add-wechat-qr
```

**手动添加**：
```markdown
---

## 📱 关于作者

**微信公众号**: 智能体开发

扫码关注公众号，获取：
- 最新技术文章
- 实战教程
- 代码示例
- 工具推荐

![智能体开发](/home/sbc/.openclaw/workspace/assets/wechat/official-account-qr.jpg)
```

---

## 📊 公众号引流策略

### 文章末尾
- 添加公众号二维码
- 引导语："扫码关注获取最新文章"
- 位置：文章末尾

### 评论区
- 第一条自评："更多技术文章请关注公众号：AI 编程实验室"
- 置顶评论

### 个人主页
- 知乎/掘金主页添加公众号信息
- GitHub README 添加公众号

---

## 🎯 使用场景

### 1. 知乎文章
在文章末尾添加：
```markdown
---
**微信公众号**: AI 编程实验室  
扫码关注获取最新文章和技术干货！
```

### 2. 掘金文章
在文章末尾添加相同内容

### 3. GitHub Gist
在 README 或 Gist 描述中添加

### 4. 公众号文章
自动包含二维码

---

## 📈 数据统计

**建议追踪**：
- 各平台引流到公众号的人数
- 扫码关注转化率
- 文章阅读数 vs 新增关注

**工具**：
- 公众号后台数据
- 带参数二维码（不同平台不同二维码）

---

*最后更新：2026-04-21*  
*维护者：秘书长 AI 团队*
