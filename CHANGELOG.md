# 更新日志

## [3.1] - 2026-01-02 模块化增强版

### 新增特性

#### 模块化架构
- ✨ 将单文件脚本拆分为模块化结构
- 📁 新增 `lib/` 目录存放所有模块
- 📁 新增 `lib/Combat/` 目录存放战斗脚本
- 🔧 使用 `#Include` 指令加载模块
- 🎯 主脚本精简至约 140 行（不含 FindText）

#### 增强的 GUI 界面
- 🎨 全新的 6 标签页设置界面
- 📊 **Tab 1: 通用设置** - 分辨率、提示、启动选项、配置管理
- ⌨️ **Tab 2: 游戏按键** - 移动、战斗、队友按键设置
- 🎮 **Tab 3: 脚本快捷键** - 所有角色和功能快捷键
- 🎯 **Tab 4: 多维变量** - 详细的多维变量配置选项
- 📈 **Tab 5: 统计信息** - 使用统计查看和重置
- ℹ️ **Tab 6: 关于** - 版本信息和免责声明
- 🖼️ 使用 Microsoft YaHei 字体，界面更美观

#### 配置管理
- 💾 **导出配置**：将当前配置保存为独立文件
- 📥 **导入配置**：从文件加载配置
- 🔄 **备份配置**：创建带时间戳的备份（格式：`settings_backup_YYYYMMDD_HHMMSS.ini`）
- ↩️ **恢复默认**：一键重置所有设置
- ✅ 自动验证配置完整性，缺失项自动补充默认值

#### 统计功能
- 📊 记录脚本总运行次数
- ⏱️ 记录总运行时长
- 📅 记录最后运行时间
- 📈 当前会话独立统计
- 💾 统计数据持久化保存到 INI 文件
- 🔄 支持重置统计数据

#### 托盘菜单增强
- 🎯 **打开设置**：快速访问设置界面
- 📊 **查看统计**：查看使用统计
- 🚪 **退出程序**：优雅退出脚本

#### 热键即时生效
- ⚡ 修改热键后无需重启脚本
- 🔄 点击"保存设置"即可立即应用
- 🎯 提升用户体验

### 模块说明

#### 核心模块
- **lib/Utils.ahk** - 通用工具函数
  - `GetColor(x, y)` - 获取屏幕颜色
  - `IsColorClose(color1, color2, tolerance)` - 颜色匹配

- **lib/Config.ahk** - 配置管理
  - 配置文件读写
  - 导出/导入/备份/恢复功能
  - 默认值管理

- **lib/Statistics.ahk** - 统计功能
  - 运行次数统计
  - 时长统计
  - 会话管理

- **lib/SettingsGUI.ahk** - GUI 界面
  - 6 标签页界面
  - 事件处理
  - 热键更新

#### 战斗脚本模块
- **lib/Combat/Jinwu.ahk** - 金乌自动战斗
- **lib/Combat/Lingguang.ahk** - 陵光自动战斗
- **lib/Combat/Tuote.ahk** - 托特/哈迪斯自动战斗
- **lib/Combat/Namei.ahk** - 娜美自动战斗
- **lib/Combat/Weier.ahk** - 薇儿自动战斗
- **lib/Combat/Fantian.ahk** - 梵天自动战斗
- **lib/Combat/Shikoudi.ahk** - 诗寇蒂自动战斗
- **lib/Combat/Dimension.ahk** - 多维变量自动刷分
- **lib/Combat/Others.ahk** - 其他功能
  - 自动烤肉
  - 简易连点器
  - 樱切自动战斗
  - 亚莉莎自动战斗

### 配置文件结构

#### settings.ini 分区
- **[General]** - 通用设置
  - Resolution - 游戏分辨率
  - ShowTooltip - 是否显示提示
  - TooltipX/Y - 提示位置
  - ScriptDelay - 脚本延迟
  - MinimizeToTray - 启动时最小化
  - AutoStart - 开机自动启动

- **[Hotkeys]** - 所有按键配置
  - 游戏移动按键（UpKey, DownKey, LeftKey, RightKey, DodgeKey）
  - 游戏战斗按键（AttackKey, Skill1-3Key, UltimateKey, Teammate1-2Key）
  - 脚本快捷键（各角色和功能快捷键）

- **[Dimension]** - 多维变量设置
  - Difficulty - 难度选择
  - AutoSelectCharacter - 自动选择角色
  - AutoSelectBeacon - 自动选择信标
  - AutoRetry - 失败自动重试
  - AutoExit - 完成后自动退出
  - MaxRuns - 最大运行次数

- **[Statistics]** - 统计数据
  - TotalRuns - 总运行次数
  - TotalTime - 总运行时长
  - LastRunTime - 最后运行时间

### 技术改进

#### 代码组织
- 📦 模块化设计，职责分离
- 🔍 代码可读性提升
- 🛠️ 易于维护和扩展
- ♻️ 代码复用率提高

#### 性能优化
- ⚡ 启动速度优化
- 💾 配置加载优化
- 🎯 热键处理优化

#### 用户体验
- 🎨 现代化 GUI 界面
- 📝 详细的中文文档
- 🔍 完善的测试指南
- 📊 使用统计可视化

### 向后兼容

- ✅ 完全兼容原有功能
- ✅ 自动迁移旧配置文件
- ✅ 所有战斗脚本保持不变
- ✅ 默认快捷键保持一致

### 文档更新

- 📖 更新 README.md，增加模块化说明
- 📋 新增 TESTING.md 测试指南
- 📝 新增 CHANGELOG.md 更新日志
- 🚫 新增 .gitignore 文件

### 项目结构

```
AetherGazer-ahk/
├── AetherGazer.ahk          # 主脚本入口（精简版）
├── settings.ini             # 用户配置文件
├── README.md                # 项目说明
├── TESTING.md               # 测试指南
├── CHANGELOG.md             # 更新日志
├── .gitignore               # Git 忽略规则
└── lib/                     # 模块目录
    ├── Config.ahk           # 配置管理模块
    ├── SettingsGUI.ahk      # GUI 界面模块
    ├── Statistics.ahk       # 统计功能模块
    ├── Utils.ahk            # 通用工具函数
    └── Combat/              # 战斗脚本目录
        ├── Jinwu.ahk
        ├── Lingguang.ahk
        ├── Tuote.ahk
        ├── Namei.ahk
        ├── Weier.ahk
        ├── Fantian.ahk
        ├── Shikoudi.ahk
        ├── Dimension.ahk
        └── Others.ahk
```

### 已知问题

无

### 下一步计划

- [ ] 添加更多角色的自动战斗脚本
- [ ] 支持更多分辨率
- [ ] 添加自定义脚本接口
- [ ] 性能监控和优化
- [ ] 多语言支持

---

## [3.0] - 之前版本

原始单文件版本，包含所有功能但缺乏模块化结构。

- 所有代码在单个 AetherGazer.ahk 文件中（5267 行）
- 简单的设置 GUI（2 个标签页）
- 基本的配置文件支持
- 所有角色自动战斗功能
- FindText 图像识别功能

---

## 升级指南

### 从 3.0 升级到 3.1

1. **备份当前配置**
   - 如果有 `settings.ini`，建议先备份

2. **下载新版本**
   - 下载完整的项目文件夹，包括 `lib` 目录

3. **迁移配置**
   - 旧的 `settings.ini` 会自动识别
   - 缺失的新配置项会自动补充默认值

4. **验证功能**
   - 打开设置界面，检查所有配置
   - 测试常用的战斗脚本

5. **享受新功能**
   - 体验新的 GUI 界面
   - 查看使用统计
   - 使用配置管理功能
