# 待生成插图清单

> **创建时间**: 2026-04-21  
> **文章**: Harness Engineering 完整实施指南  
> **状态**: 待生成

---

## 📋 需要生成的插图

### 1. 架构图

**用途**：展示秘书长 +3 子代理+Harness 层架构

**要求**：
- 分辨率：1920x1080
- 风格：扁平矢量
- 配色：科技蓝 + 紫色渐变
- 元素：秘书长、3 子代理、Harness 层、连接线条、齿轮、盾牌

**提示词**：
```
专业科技架构图，AI Agent 协作系统，3 层结构：
- 顶层：秘书长（Coordinator）
- 第二层：3 个子代理（qingbao/wenan/jiaoxue）
- 底层：Harness Engineering 层
- 连接线条表示数据流
- 齿轮符号表示工作流引擎
- 盾牌符号表示保护机制
- 科技蓝紫色渐变背景
- 扁平矢量风格
- 16:9 宽高比
```

**生成命令**：
```bash
bun ~/.openclaw/skills/baoyu-image-gen/scripts/main.ts \
  --prompt "专业科技架构图..." \
  --image docs/harness-engineering-guide/images/architecture.png \
  --ar 16:9 \
  --quality 2k
```

**状态**: ⏳ 待生成（需要 API key）

---

### 2. 流程图

**用途**：展示事务处理流程

**要求**：
- 分辨率：1920x1080
- 风格：扁平矢量
- 配色：科技蓝 + 绿色
- 元素：用户请求、秘书长决策、子代理执行、结果汇总

**提示词**：
```
专业流程图，事务处理流程：
- 起点：用户请求
- 决策点：秘书长分类（简单/复杂）
- 分支 1：简单事务→自己处理
- 分支 2：复杂事务→派发给子代理
- 子代理：qingbao/wenan/jiaoxue
- 终点：结果汇总
- 箭头表示流程方向
- 科技蓝绿色配色
- 扁平矢量风格
- 16:9 宽高比
```

**状态**: ⏳ 待生成（需要 API key）

---

### 3. 数据图表

**用途**：展示 4 个阶段成果对比

**要求**：
- 分辨率：1920x1080
- 类型：柱状图/雷达图
- 配色：蓝紫渐变
- 数据：4 个阶段的脚本数/模板数/能力评分

**状态**: ⏳ 待生成（需要 API key）

---

### 4. 封面图（已生成）

**状态**: ✅ 已完成
**位置**: `/home/sbc/.openclaw/workspace/covers/harness-implementation-guide-cover.jpg`

---

## 🔧 生成前准备

### API Key 配置

需要配置以下任一 API key：

```bash
# 推荐：阿里通义万象
echo "DASHSCOPE_API_KEY=sk-xxx" >> ~/.baoyu-skills/.env

# 或其他
echo "OPENAI_API_KEY=sk-xxx" >> ~/.baoyu-skills/.env
echo "GOOGLE_API_KEY=xxx" >> ~/.baoyu-skills/.env
```

### 目录准备

```bash
mkdir -p /home/sbc/.openclaw/workspace/docs/harness-engineering-guide/images
```

---

## 📊 优先级

| 插图 | 优先级 | 说明 |
|------|--------|------|
| 架构图 | 🔴 高 | 文章核心，必须生成 |
| 流程图 | 🔴 高 | 帮助理解流程 |
| 数据图表 | 🟡 中 | 增强说服力 |
| 其他插图 | 🟢 低 | 可选 |

---

## ✅ 完成标准

- [ ] 架构图已生成并保存
- [ ] 流程图已生成并保存
- [ ] 数据图表已生成并保存
- [ ] 所有插图分辨率≥1920x1080
- [ ] 所有插图文件大小<5MB
- [ ] 所有插图风格统一
- [ ] 文章中正确引用所有插图
- [ ] GitHub 仓库已更新

---

*最后更新：2026-04-21*  
*状态：待生成（需要 API key）*
