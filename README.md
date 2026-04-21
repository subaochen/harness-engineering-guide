# 80 分钟搭建 AI 秘书团队：Harness Engineering 完整实施指南

![封面图：AI Agent 协作系统](./cover.jpg)

> **摘要**：从 0 到 1 搭建基于 Harness Engineering 的多 Agent 协作系统，4 个阶段、15 个脚本、5 个工作流模板，系统自愈率>80%。本文完整公开所有代码和配置，可直接复用。

---

## 🚀 快速开始

### 一键部署

```bash
# 克隆仓库
git clone https://github.com/subaochen/harness-engineering-guide.git
cd harness-engineering-guide

# 查看文档
cat README.md

# 阅读完整指南
cat harness-engineering-implementation-guide.md
```

### 核心成果

- ✅ **4 个阶段**：基础建设→可观测性→故障恢复→高级协作
- ✅ **15 个脚本**：归档/监控/告警/工作流/路由等
- ✅ **5 个工作流模板**：开箱即用
- ✅ **系统自愈率>80%**：自动重试 + 降级处理
- ✅ **一键发布**：知乎/掘金/GitHub/公众号

---

## 📚 文档导航

| 文档 | 说明 | 位置 |
|------|------|------|
| 📘 **完整实施指南** | 4 个阶段完整实施过程 | [阅读全文 →](./harness-engineering-implementation-guide.md) |
| 🚀 **一键发布流程** | 知乎/掘金/GitHub一键发布 | [查看](./docs-processes/one-click-publish-workflow.md) |
| 📱 **公众号发布流程** | 微信公众号半自动发布 | [查看](./docs-processes/wechat-publish-manual.md) |
| 🎨 **插图规范** | 文章插图生成标准 | [查看](./configs/article-illustration-standards.md) |

---

## 🛠️ 工具脚本

### 一键发布脚本

```bash
# 发布到知乎/掘金/GitHub
./scripts/publish-multi-platform.sh docs/your-article.md

# 指定标题和标签
./scripts/publish-multi-platform.sh docs/article.md "文章标题" "AI,Agent,OpenClaw"
```

**功能**：
- ✅ 自动发布到 GitHub Gist
- ✅ 自动打开知乎/掘金创作后台
- ✅ 自动生成封面图（需 API key）
- ✅ 自动添加公众号关注引导
- ✅ 自动创建发布记录

### 其他脚本

| 脚本 | 用途 |
|------|------|
| `publish-multi-platform.sh` | 一键多平台发布 |
| `workflow-engine.sh` | 工作流引擎 |
| `smart-router.sh` | 智能路由 |
| `parallel-dispatch.sh` | 并行任务分发 |

---

## 📁 项目结构

```
harness-engineering-guide/
├── README.md                          # 项目首页
├── cover.jpg                          # 封面图
├── harness-engineering-implementation-guide.md  # 完整文章
├── scripts/
│   └── publish-multi-platform.sh      # 一键发布脚本
├── docs-processes/
│   ├── one-click-publish-workflow.md  # 发布流程
│   └── wechat-publish-manual.md       # 公众号流程
├── configs/
│   ├── article-illustration-standards.md  # 插图规范
│   ├── contact-info.md                # 联系方式
│   └── retry-policy.json              # 重试策略
└── images/
    └── TODO-IMAGES.md                 # 待生成插图清单
```

---

## 📱 关注我

**微信公众号**: 智能体开发

专注于分享：
- AI Agent 开发与自动化
- Harness Engineering 实战
- OpenClaw 技术应用
- 编程效率提升

![关注智能体开发](./wechat-qr.jpg)

*扫码关注，获取最新文章和技术干货*

---

## 🎯 核心能力

| 能力 | 实现方式 | 效果 |
|------|----------|------|
| 可追溯 | 事务日志 + 唯一 ID | 100% 事务可查询 |
| 可观测 | 心跳监控 + 多维表格 | 5 分钟发现异常 |
| 可恢复 | 自动重试 + 降级切换 | 自愈率>80% |
| 可编排 | 工作流引擎 + 并行分发 | 复杂任务自动化 |

---

## 💡 关键决策

1. **先固化流程，再自动化**（阶段 1 最重要）
2. **可观测性是基础**（没有监控就没有优化）
3. **故障恢复要分层**（自动→降级→人工）
4. **工作流编排是终极目标**（解放人力）

---

## 📞 联系我们

- **微信公众号**: 智能体开发
- **GitHub**: [@subaochen](https://github.com/subaochen)
- **问题反馈**: [Issues](https://github.com/subaochen/harness-engineering-guide/issues)

---

**作者**: 秘书长 AI 团队  
**发布日期**: 2026-04-21  
**许可证**: CC BY-NC-SA 4.0

---

*如果这个项目对你有帮助，欢迎 Star ⭐️ 支持！*
