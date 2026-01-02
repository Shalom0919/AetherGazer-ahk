; ----------------------------------------------------------------------------
; 增强的 GUI 设置界面模块
; 包含 6 个标签页：通用设置、游戏按键、脚本快捷键、多维变量、统计信息、关于
; ----------------------------------------------------------------------------

ShowSettingsGUI()
{
	global
	
	Gui, SettingsGui:New
	Gui, SettingsGui:Font, s9, Microsoft YaHei
	Gui, SettingsGui:Add, Tab3, x10 y10 w580 h500, 通用设置|游戏按键|脚本快捷键|多维变量|统计信息|关于
	
	; ========================================================================
	; Tab 1: 通用设置
	; ========================================================================
	Gui, SettingsGui:Tab, 通用设置
	
	; 分辨率设置
	Gui, SettingsGui:Add, GroupBox, x20 y40 w260 h120, 显示设置
	Gui, SettingsGui:Add, Text, x30 y60, 游戏分辨率：
	Gui, SettingsGui:Add, DropDownList, x130 y57 w130 vResolution, 1280x720|1920x1080|2560x1440|自定义
	GuiControl, SettingsGui:ChooseString, Resolution, %Resolution%
	
	Gui, SettingsGui:Add, Checkbox, x30 y90 vShowTooltip Checked%ShowTooltip%, 显示状态提示
	Gui, SettingsGui:Add, Text, x30 y115, 提示位置 X：
	Gui, SettingsGui:Add, Edit, x110 y112 w60 vTooltipX, %TooltipX%
	Gui, SettingsGui:Add, Text, x180 y115, Y：
	Gui, SettingsGui:Add, Edit, x210 y112 w60 vTooltipY, %TooltipY%
	
	; 启动设置
	Gui, SettingsGui:Add, GroupBox, x20 y170 w260 h100, 启动设置
	Gui, SettingsGui:Add, Checkbox, x30 y190 vMinimizeToTray Checked%MinimizeToTray%, 启动时最小化到托盘
	Gui, SettingsGui:Add, Checkbox, x30 y215 vAutoStart Checked%AutoStart%, 开机自动启动
	Gui, SettingsGui:Add, Text, x30 y240, 脚本延迟（毫秒）：
	Gui, SettingsGui:Add, Edit, x150 y237 w60 vScriptDelay, %ScriptDelay%
	
	; 配置管理
	Gui, SettingsGui:Add, GroupBox, x20 y280 w260 h200, 配置管理
	Gui, SettingsGui:Add, Button, x30 y305 w230 h30 gExportConfigBtn, 导出配置
	Gui, SettingsGui:Add, Button, x30 y345 w230 h30 gImportConfigBtn, 导入配置
	Gui, SettingsGui:Add, Button, x30 y385 w230 h30 gBackupConfigBtn, 备份配置
	Gui, SettingsGui:Add, Button, x30 y425 w230 h30 gRestoreConfigBtn, 恢复默认设置
	
	; ========================================================================
	; Tab 2: 游戏按键
	; ========================================================================
	Gui, SettingsGui:Tab, 游戏按键
	
	Gui, SettingsGui:Add, Text, x20 y40, 设置与你游戏内按键对应
	
	; 移动按键
	Gui, SettingsGui:Add, GroupBox, x20 y65 w260 h150, 移动按键
	Gui, SettingsGui:Add, Text, x30 y85, 前进：
	Gui, SettingsGui:Add, Hotkey, x100 y82 w150 vUpKey, %UpKey%
	Gui, SettingsGui:Add, Text, x30 y110, 后退：
	Gui, SettingsGui:Add, Hotkey, x100 y107 w150 vDownKey, %DownKey%
	Gui, SettingsGui:Add, Text, x30 y135, 左移：
	Gui, SettingsGui:Add, Hotkey, x100 y132 w150 vLeftKey, %LeftKey%
	Gui, SettingsGui:Add, Text, x30 y160, 右移：
	Gui, SettingsGui:Add, Hotkey, x100 y157 w150 vRightKey, %RightKey%
	Gui, SettingsGui:Add, Text, x30 y185, 闪避：
	Gui, SettingsGui:Add, Hotkey, x100 y182 w150 vDodgeKey, %DodgeKey%
	
	; 战斗按键
	Gui, SettingsGui:Add, GroupBox, x300 y65 w260 h150, 战斗按键
	Gui, SettingsGui:Add, Text, x310 y85, 普攻：
	Gui, SettingsGui:Add, Hotkey, x380 y82 w150 vAttackKey, %AttackKey%
	Gui, SettingsGui:Add, Text, x310 y110, 技能1：
	Gui, SettingsGui:Add, Hotkey, x380 y107 w150 vSkill1Key, %Skill1Key%
	Gui, SettingsGui:Add, Text, x310 y135, 技能2：
	Gui, SettingsGui:Add, Hotkey, x380 y132 w150 vSkill2Key, %Skill2Key%
	Gui, SettingsGui:Add, Text, x310 y160, 技能3：
	Gui, SettingsGui:Add, Hotkey, x380 y157 w150 vSkill3Key, %Skill3Key%
	Gui, SettingsGui:Add, Text, x310 y185, 奥义：
	Gui, SettingsGui:Add, Hotkey, x380 y182 w150 vUltimateKey, %UltimateKey%
	
	; 队友按键
	Gui, SettingsGui:Add, GroupBox, x20 y225 w260 h80, 队友按键
	Gui, SettingsGui:Add, Text, x30 y245, 队友1奥义：
	Gui, SettingsGui:Add, Hotkey, x120 y242 w130 vTeammate1Key, %Teammate1Key%
	Gui, SettingsGui:Add, Text, x30 y270, 队友2奥义：
	Gui, SettingsGui:Add, Hotkey, x120 y267 w130 vTeammate2Key, %Teammate2Key%
	
	; ========================================================================
	; Tab 3: 脚本快捷键
	; ========================================================================
	Gui, SettingsGui:Tab, 脚本快捷键
	
	Gui, SettingsGui:Add, Text, x20 y40, 角色自动战斗和功能快捷键设置
	
	; 角色自动战斗
	Gui, SettingsGui:Add, GroupBox, x20 y65 w260 h240, 角色自动战斗
	Gui, SettingsGui:Add, Text, x30 y85, 金乌：
	Gui, SettingsGui:Add, Hotkey, x100 y82 w150 vJinwuKey, %JinwuKey%
	Gui, SettingsGui:Add, Text, x30 y110, 陵光：
	Gui, SettingsGui:Add, Hotkey, x100 y107 w150 vLingguangKey, %LingguangKey%
	Gui, SettingsGui:Add, Text, x30 y135, 托特/哈迪斯：
	Gui, SettingsGui:Add, Hotkey, x130 y132 w120 vTuoteKey, %TuoteKey%
	Gui, SettingsGui:Add, Text, x30 y160, 娜美：
	Gui, SettingsGui:Add, Hotkey, x100 y157 w150 vNameiKey, %NameiKey%
	Gui, SettingsGui:Add, Text, x30 y185, 薇儿：
	Gui, SettingsGui:Add, Hotkey, x100 y182 w150 vWeierKey, %WeierKey%
	Gui, SettingsGui:Add, Text, x30 y210, 梵天：
	Gui, SettingsGui:Add, Hotkey, x100 y207 w150 vFantianKey, %FantianKey%
	Gui, SettingsGui:Add, Text, x30 y235, 诗寇蒂：
	Gui, SettingsGui:Add, Hotkey, x100 y232 w150 vShikoudiKey, %ShikoudiKey%
	Gui, SettingsGui:Add, Text, x30 y260, 樱切：
	Gui, SettingsGui:Add, Hotkey, x100 y257 w150 vFengqianfangtiangouKey, %FengqianfangtiangouKey%
	Gui, SettingsGui:Add, Text, x30 y285, 亚莉莎：
	Gui, SettingsGui:Add, Hotkey, x100 y282 w150 vYalishaKey, %YalishaKey%
	
	; 功能快捷键
	Gui, SettingsGui:Add, GroupBox, x300 y65 w260 h150, 功能快捷键
	Gui, SettingsGui:Add, Text, x310 y85, 多维变量：
	Gui, SettingsGui:Add, Hotkey, x390 y82 w140 vDimensionKey, %DimensionKey%
	Gui, SettingsGui:Add, Text, x310 y110, 自动烤肉：
	Gui, SettingsGui:Add, Hotkey, x390 y107 w140 vKaorouKey, %KaorouKey%
	Gui, SettingsGui:Add, Text, x310 y135, 简易连点器：
	Gui, SettingsGui:Add, Hotkey, x390 y132 w140 vLiandianKey, %LiandianKey%
	Gui, SettingsGui:Add, Text, x310 y160, 停止脚本：
	Gui, SettingsGui:Add, Hotkey, x390 y157 w140 vStopscriptKey, %StopscriptKey%
	
	; ========================================================================
	; Tab 4: 多维变量
	; ========================================================================
	Gui, SettingsGui:Tab, 多维变量
	
	Gui, SettingsGui:Add, Text, x20 y40, 多维变量自动刷分设置（分辨率要求：1280x720）
	
	Gui, SettingsGui:Add, GroupBox, x20 y65 w540 h120, 基本设置
	Gui, SettingsGui:Add, Text, x30 y85, 选择难度：
	Gui, SettingsGui:Add, DropDownList, x120 y82 w100 vDimensionDifficulty, 15|18|20
	GuiControl, SettingsGui:ChooseString, DimensionDifficulty, %DimensionDifficulty%
	Gui, SettingsGui:Add, Checkbox, x30 y110 vDimensionAutoSelect Checked%DimensionAutoSelect%, 自动选择角色（真红）
	Gui, SettingsGui:Add, Checkbox, x30 y135 vDimensionAutoBeacon Checked%DimensionAutoBeacon%, 自动选择信标
	Gui, SettingsGui:Add, Text, x30 y160, 注：需解锁信标「赏金猎人」「孤狼之道」「残酷天平」
	
	Gui, SettingsGui:Add, GroupBox, x20 y195 w540 h120, 高级设置
	Gui, SettingsGui:Add, Checkbox, x30 y215 vDimensionRetry Checked%DimensionRetry%, 失败自动重试
	Gui, SettingsGui:Add, Checkbox, x30 y240 vDimensionAutoExit Checked%DimensionAutoExit%, 完成后自动退出
	Gui, SettingsGui:Add, Text, x30 y265, 最大运行次数（0=无限制）：
	Gui, SettingsGui:Add, Edit, x210 y262 w60 vDimensionMaxRuns, %DimensionMaxRuns%
	
	; ========================================================================
	; Tab 5: 统计信息
	; ========================================================================
	Gui, SettingsGui:Tab, 统计信息
	
	sessionDuration := GetSessionDuration()
	
	Gui, SettingsGui:Add, GroupBox, x20 y40 w540 h140, 总体统计
	Gui, SettingsGui:Add, Text, x30 y65, 总运行次数：
	Gui, SettingsGui:Add, Text, x150 y65, %TotalRuns% 次
	Gui, SettingsGui:Add, Text, x30 y95, 总运行时长：
	Gui, SettingsGui:Add, Text, x150 y95, % GetFormattedTime(TotalTime)
	Gui, SettingsGui:Add, Text, x30 y125, 最后运行时间：
	Gui, SettingsGui:Add, Text, x150 y125, %LastRunTime%
	
	Gui, SettingsGui:Add, GroupBox, x20 y190 w540 h100, 当前会话统计
	Gui, SettingsGui:Add, Text, x30 y215, 会话运行次数：
	Gui, SettingsGui:Add, Text, x150 y215, %SessionRuns% 次
	Gui, SettingsGui:Add, Text, x30 y245, 会话时长：
	Gui, SettingsGui:Add, Text, x150 y245, % GetFormattedTime(sessionDuration)
	
	Gui, SettingsGui:Add, Button, x20 y300 w540 h40 gResetStatisticsBtn, 重置统计数据
	
	; ========================================================================
	; Tab 6: 关于
	; ========================================================================
	Gui, SettingsGui:Tab, 关于
	
	Gui, SettingsGui:Font, s11 Bold
	Gui, SettingsGui:Add, Text, x20 y50, 深空之眼 AHK 自动脚本
	Gui, SettingsGui:Font, s9 Norm
	Gui, SettingsGui:Add, Text, x20 y80, 版本：4.0（模块化架构版）
	
	Gui, SettingsGui:Add, GroupBox, x20 y110 w540 h100, 原作者信息
	Gui, SettingsGui:Add, Text, x30 y130, 作者：qstdnx
	Gui, SettingsGui:Add, Text, x30 y155, 项目地址：https://github.com/qstdnx/AetherGazer-ahk
	Gui, SettingsGui:Add, Link, x30 y180, 问题反馈：<a href="https://github.com/qstdnx/AetherGazer-ahk/issues">GitHub Issues</a>
	
	Gui, SettingsGui:Add, GroupBox, x20 y220 w540 h120, 免责声明
	Gui, SettingsGui:Font, s8
	Gui, SettingsGui:Add, Text, x30 y240 w520, 这是 AHK 按键脚本，而不是外挂，没有注入和修改数据，只是模拟键盘鼠标。目前脚本发布至今没有因使用脚本被封号的案例，但不排除以后会出现，请谨慎使用。
	
	Gui, SettingsGui:Font, s9 Norm
	Gui, SettingsGui:Tab
	
	; 底部按钮
	Gui, SettingsGui:Add, Button, x350 y520 w110 h30 gSaveSettingsBtn Default, 保存设置
	Gui, SettingsGui:Add, Button, x470 y520 w110 h30 gCancelSettingsBtn, 取消
	
	Gui, SettingsGui:Show, w600 h565, 深空之眼脚本设置
}

; GUI 事件处理函数
SettingsGuiClose:
SettingsGuiEscape:
CancelSettingsBtn:
	Gui, SettingsGui:Destroy
return

SaveSettingsBtn:
	Gui, SettingsGui:Submit, NoHide
	
	; 保存所有设置到全局变量
	SaveConfig()
	
	; 重新设置热键 (调用 HotkeyManager.ahk 中的函数)
	UpdateHotkeys()
	
	Gui, SettingsGui:Destroy
	MsgBox, 64, 保存成功, 设置已保存并应用
return

ExportConfigBtn:
	ExportConfig()
return

ImportConfigBtn:
	ImportConfig()
return

BackupConfigBtn:
	BackupConfig()
return

RestoreConfigBtn:
	RestoreDefaultConfig()
return

ResetStatisticsBtn:
	ResetStatistics()
	Gui, SettingsGui:Destroy
return
