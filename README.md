# 深空之眼 AHK 自动脚本

## 版本信息

**当前版本：4.0（模块化重构版）**

本版本对脚本进行了完全的模块化重构，采用清晰的目录结构，大幅提升了代码的可维护性和可扩展性。

### 新版本特性

- ✨ **模块化架构**：代码按功能拆分为独立模块，易于维护和扩展
- 🏗️ **清晰的目录结构**：Core、Config、GUI、Combat、Utils等目录分类明确
- 🔧 **战斗基类**：提供通用战斗函数，简化新角色脚本开发
- 📝 **新角色模板**：详细的模板文件，添加新角色只需几个步骤
- 🎨 **增强的GUI界面**：保留原有的6标签页设置界面
- 🖥️ **浮动控制面板**：可视化的脚本控制界面
- 📊 **统计功能**：记录脚本使用次数和时长
- ⚙️ **配置管理**：支持配置导出、导入、备份和恢复
- 🔧 **热键即时生效**：修改热键无需重启脚本
- 💾 **持久化配置**：所有设置自动保存到 settings.ini

## 项目结构

```
AetherGazer-ahk/
├── AetherGazerMain.ahk          # 主脚本入口（模块化重构）
├── settings.ini                  # 用户配置文件（自动生成）
├── lib/
│   ├── Core/                     # 核心模块
│   │   ├── GlobalVars.ahk        # 全局变量定义
│   │   └── HotkeyManager.ahk     # 热键管理
│   ├── Config/                   # 配置模块
│   │   ├── Config.ahk            # 配置管理
│   │   └── KeyMappings.ahk       # 按键映射定义
│   ├── GUI/                      # 界面模块
│   │   ├── TrayMenu.ahk          # 托盘菜单
│   │   ├── SettingsGUI.ahk       # 设置界面
│   │   └── FloatGUI.ahk          # 浮动面板
│   ├── Combat/                   # 战斗脚本
│   │   ├── CombatBase.ahk        # 战斗基类（通用函数）
│   │   ├── Jinwu.ahk             # 金乌
│   │   ├── Lingguang.ahk         # 陵光
│   │   ├── Tuote.ahk             # 托特/哈迪斯
│   │   ├── Namei.ahk             # 娜美
│   │   ├── Weier.ahk             # 薇儿
│   │   ├── Fantian.ahk           # 梵天
│   │   ├── Shikoudi.ahk          # 诗寇蒂
│   │   ├── Others.ahk            # 其他功能（烤肉、连点器、樱切、亚莉莎）
│   │   ├── Dimension.ahk         # 多维变量
│   │   └── _NewCharacterTemplate.ahk  # 新角色模板
│   ├── Utils/                    # 工具模块
│   │   └── Utils.ahk             # 工具函数（GetColor、IsColorClose等）
│   ├── Statistics/               # 统计模块
│   │   └── Statistics.ahk        # 统计功能
│   └── Vendor/                   # 第三方库
│       └── FindText.ahk          # FindText库（保持不变）
└── README.md
```

## 免责声明

这是 AHK 按键脚本，而不是外挂，没有注入和修改数据，只是模拟键盘鼠标，所以说不会被封。目前脚本发布至今没有因使用脚本被封号的案例，但仍有风险，勇士对按键脚本的态度可能改变，所以如果造成封号或其他问题，本工具作者不承担任何责任。

---

## 使用指南

### 视频教程

[点击观看视频教程](https://www.bilibili.com/video/BV1ZxxmeDEdn/)

### 快速开始

1. **下载脚本**：下载 `AetherGazerMain.ahk` 以及整个 `lib` 目录
2. **运行脚本**：双击 `AetherGazerMain.ahk` 启动（需要管理员权限）
3. **使用控制面板**：脚本启动后会自动显示浮动控制面板
   - 从下拉列表选择要使用的角色
   - 点击"启动脚本"开始自动战斗
   - 或使用传统的热键方式
4. **配置按键**：点击"打开设置"或在系统托盘右键选择"快捷键设置"
5. **调整位置**：拖动控制面板标题栏可以移动到合适的位置

### 重要注意事项

#### 游戏设置要求

1. **分辨率**：游戏分辨率必须设置为 **1280x720**
2. **战斗界面**：如有自定义战斗界面，使用脚本时请还原为默认
3. **按键布局**：建议使用默认布局

#### 多维变量刷分要求

- 解锁 **20 难度**
- 解锁角色 **真红**
- 解锁信标：**赏金猎人**、**孤狼之道**、**残酷天平**

---

## 功能说明

### 默认快捷键

| 快捷键 | 功能 | 说明 |
|--------|------|------|
| 小键盘 1 | 金乌自动出招 | - |
| 小键盘 2 | 多维变量自动刷分 | 需满足特定要求 |
| 小键盘 3 | 陵光自动出招 | - |
| 小键盘 4 | 托特/哈迪斯/雷前鬼/水姆 | - |
| 小键盘 5 | 娜美自动出招 | - |
| 小键盘 6 | 薇儿/光赫拉/瓦吉特/执明 | - |
| 小键盘 7 | 闲暇时刻自动烤肉 | - |
| 小键盘 9 | 简易按键连点器 | 右 Ctrl+任意键=连点该键 |
| 小键盘 0 | 停止运行中的操作 | - |
| Ctrl+小键盘 1 | 梵天自动出招 | 队友帕尔瓦蒂必须放2号位 |
| Ctrl+小键盘 2 | 诗寇蒂自动出招 | - |
| Ctrl+小键盘 3 | 樱切自动出招 | 左线 |
| Ctrl+小键盘 4 | 亚莉莎自动出招 | 左线 |

所有快捷键均可在设置界面中自定义。

---

## 添加新角色

模块化重构后，添加新角色变得非常简单！

### 步骤

1. **复制模板文件**
   ```
   复制 lib/Combat/_NewCharacterTemplate.ahk
   重命名为新角色文件，例如 lib/Combat/Xingjian.ahk
   ```

2. **修改战斗逻辑**
   - 打开新创建的文件
   - 按照模板中的注释修改角色ID、标签名
   - 在 Press 标签中编写战斗逻辑

3. **添加热键定义**
   - 打开 `lib/Config/KeyMappings.ahk`
   - 在 `GetDefaultKeyMappings()` 中添加热键：
     ```ahk
     mappings["XingjianKey"] := "Numpad8"
     ```
   - 在 `GetCharacterMeta()` 中添加元数据：
     ```ahk
     characters.Push({id: 15, name: "星见", keyVar: "XingjianKey", label: "Xingjian"})
     ```

4. **在主文件中包含**
   - 打开 `AetherGazerMain.ahk`
   - 在战斗脚本加载区域添加：
     ```ahk
     #Include lib\Combat\Xingjian.ahk
     ```

5. **（可选）添加GUI控件**
   - 在 `lib/GUI/SettingsGUI.ahk` 中添加设置项
   - 在 `lib/GUI/FloatGUI.ahk` 中添加到下拉列表

6. **测试**
   - 运行脚本，设置界面中会自动出现新角色的热键设置
   - 进入游戏测试新角色脚本

### 示例

参考模板文件 `lib/Combat/_NewCharacterTemplate.ahk`，里面有详细的注释和示例代码。

---

## 模块说明

### 核心模块 (Core)

- **GlobalVars.ahk**：定义所有全局变量和战斗标志
- **HotkeyManager.ahk**：管理所有热键的注册和更新

### 配置模块 (Config)

- **Config.ahk**：处理配置文件的读取、保存、导入、导出
- **KeyMappings.ahk**：定义默认按键映射和角色元数据

### GUI模块 (GUI)

- **TrayMenu.ahk**：托盘菜单初始化
- **SettingsGUI.ahk**：6标签页的详细设置界面
- **FloatGUI.ahk**：浮动控制面板

### 战斗模块 (Combat)

- **CombatBase.ahk**：提供通用战斗函数
  - `ToggleCombatScript()` - 通用切换函数
  - `CheckAndStopCombat()` - 检查并停止战斗
  - `SendCombo()` - 发送连招
  - `LoopSkillUse()` - 循环使用技能
  - 等等...

- **各角色脚本**：每个角色一个独立文件

### 工具模块 (Utils)

- **Utils.ahk**：提供常用工具函数
  - `GetColor()` - 获取颜色
  - `IsColorClose()` - 颜色比较
  - `ShowStatus()` - 显示状态
  - `SendKeyWithDelay()` - 发送按键
  - `WaitForColor()` - 等待颜色出现
  - 等等...

### 统计模块 (Statistics)

- **Statistics.ahk**：记录和显示使用统计

### 第三方库 (Vendor)

- **FindText.ahk**：图像识别库，用于多维变量等功能

---

## 技术说明

### 配置文件

所有设置保存在 `settings.ini` 文件中，包含以下部分：

- `[General]`：通用设置（分辨率、提示、启动选项）
- `[Hotkeys]`：游戏按键和脚本快捷键
- `[Dimension]`：多维变量设置
- `[Statistics]`：使用统计数据

### AHK v1.1 兼容性

所有代码都使用 AHK v1.1 语法编写，确保：
- 使用 `global` 声明全局变量
- 使用 `#Include` 加载模块
- 保持向后兼容的变量名（如 `1_Enable`）
- 可以正常编译为 .exe 文件

### 热键即时生效

修改热键后无需重启脚本，点击"保存设置"即可立即应用新的热键配置。这是通过 `UpdateHotkeys()` 函数实现的。

---

## 开发指南

### 修改现有角色

1. 打开对应的角色文件（例如 `lib/Combat/Jinwu.ahk`）
2. 修改 Press 标签中的战斗逻辑
3. 保存文件后重新运行脚本

### 添加新的工具函数

1. 打开 `lib/Utils/Utils.ahk`
2. 添加新函数
3. 在需要使用的地方直接调用

### 修改GUI界面

1. 打开对应的GUI文件（`SettingsGUI.ahk` 或 `FloatGUI.ahk`）
2. 按照 AHK GUI 语法修改
3. 保存后重新运行脚本查看效果

---

## 原作者信息

- **作者**：qstdnx
- **项目地址**：https://github.com/qstdnx/AetherGazer-ahk
- **问题反馈**：https://github.com/qstdnx/AetherGazer-ahk/issues

## Fork 维护者

- **模块化重构**：Shalom0919
- **本 Fork 地址**：https://github.com/Shalom0919/AetherGazer-ahk

---

## 许可证

本项目采用与原项目相同的许可证。

## 更新日志

### v4.0 (2024-01-02) - 模块化重构版
- ✨ 完全重构为模块化架构
- 📁 清晰的目录结构（Core、Config、GUI、Combat、Utils等）
- 🔧 添加战斗基类，提供通用战斗函数
- 📝 提供详细的新角色模板
- 🎯 简化添加新角色的流程
- 📚 更新文档，添加开发指南
- 🐛 修复部分已知问题
- ⚡ 优化代码结构，提升可维护性

### v3.1 - 模块化增强版
- 初始模块化尝试
- 添加GUI界面和统计功能

---

## 常见问题

### Q: 脚本无法启动？
A: 确保以管理员权限运行，并检查 AHK v1.1 是否正确安装。

### Q: 热键不生效？
A: 检查游戏是否为活动窗口，热键仅在游戏窗口激活时有效。

### Q: 如何添加新角色？
A: 参考上面的"添加新角色"章节，按步骤操作即可。

### Q: 多维变量不工作？
A: 检查分辨率是否为 1280x720，是否解锁了所需角色和信标。

### Q: 如何备份配置？
A: 在设置界面中使用"备份配置"按钮，或直接复制 `settings.ini` 文件。

---

## 贡献

欢迎提交 Issue 和 Pull Request！

如果您：
- 添加了新角色脚本
- 优化了现有代码
- 修复了bug
- 改进了文档

请提交 PR，让更多玩家受益！
