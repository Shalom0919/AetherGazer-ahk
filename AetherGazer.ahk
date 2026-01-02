; ----------------------------------------------------------------------------
; Script Name: 深空之眼
; Version: 3.1 (模块化增强版)
; Author: qstdnx
; Contact: https://github.com/qstdnx/AetherGazer-ahk/issues
; Fork: Modularized by Shalom0919
; ----------------------------------------------------------------------------

#Persistent             ; 让脚本持久运行
#SingleInstance, Force  ; 运行替换旧实例
ListLines, Off          ; 不显示最近执行的脚本行
SetBatchLines, -1       ; 脚本全速执行(默认10ms)
CoordMode, Menu, Window ; 坐标相对活动窗口

; ============================================================================
; 获取管理员权限
; ============================================================================
if !A_IsAdmin
{
	try
	{
		if A_IsCompiled
			Run *RunAs "%A_ScriptFullPath%" %1% %2% %3% %4% %5% %6% %7% %8% %9%
		else
			Run *RunAs "%A_AhkPath%" "%A_ScriptFullPath%" %1% %2% %3% %4% %5% %6% %7% %8% %9%
		ExitApp
	}
	catch
	{
		MsgBox "管理员权限请求被拒绝，3.5版本后深空之眼需要使用管理员权限运行脚本"
		ExitApp
	}
}

; ============================================================================
; 加载模块
; ============================================================================
#Include %A_ScriptDir%\lib\Utils.ahk
#Include %A_ScriptDir%\lib\Config.ahk
#Include %A_ScriptDir%\lib\Statistics.ahk
#Include %A_ScriptDir%\lib\SettingsGUI.ahk
#Include %A_ScriptDir%\lib\Combat\Jinwu.ahk
#Include %A_ScriptDir%\lib\Combat\Lingguang.ahk
#Include %A_ScriptDir%\lib\Combat\Tuote.ahk
#Include %A_ScriptDir%\lib\Combat\Namei.ahk
#Include %A_ScriptDir%\lib\Combat\Weier.ahk
#Include %A_ScriptDir%\lib\Combat\Fantian.ahk
#Include %A_ScriptDir%\lib\Combat\Shikoudi.ahk
#Include %A_ScriptDir%\lib\Combat\Dimension.ahk
#Include %A_ScriptDir%\lib\Combat\Others.ahk

; ============================================================================
; 初始化
; ============================================================================
global ScriptDir := A_ScriptDir

; 加载配置
LoadConfig()

; 加载统计数据
LoadStatistics()

; ============================================================================
; 设置热键
; ============================================================================
Hotkey, %JinwuKey%, Jinwu
Hotkey, %DimensionKey%, Dimension
Hotkey, %LingguangKey%, Lingguang
Hotkey, %TuoteKey%, Tuote
Hotkey, %NameiKey%, Namei
Hotkey, %WeierKey%, Weier
Hotkey, %KaorouKey%, Kaorou
Hotkey, %LiandianKey%, Liandian
Hotkey, %FantianKey%, Fantian
Hotkey, %ShikoudiKey%, Shikoudi
Hotkey, %FengqianfangtiangouKey%, Fengqianfangtiangou
Hotkey, %YalishaKey%, Yalisha
Hotkey, %StopscriptKey%, Stopscript

; ============================================================================
; 托盘菜单
; ============================================================================
Menu, Tray, NoStandard
Menu, Tray, Add, 打开设置, ShowSettingsGUILabel
Menu, Tray, Add, 查看统计, ShowStatisticsLabel
Menu, Tray, Add
Menu, Tray, Add, 退出程序, ExitScript
Menu, Tray, Default, 打开设置
Menu, Tray, Tip, 深空之眼自动脚本

; ============================================================================
; 游戏激活时有效的设置
; ============================================================================
#If WinActive("ahk_exe AetherGazer.exe") || WinActive("ahk_exe AetherGazer_Bili.exe")
SysGet, VirtualWidth, 16
SysGet, VirtualHeight, 17
CoordMode, ToolTip, Screen
return

; ============================================================================
; 停止脚本函数
; ============================================================================
Stopscript:
	Reload
	1_Enable := False
	2_Enable := False
	3_Enable := False
	4_Enable := False
	5_Enable := False
	6_Enable := False
	7_Enable := False
	9_Enable := False
	11_Enable := False
	12_Enable := False
	13_Enable := False
	14_Enable := False
return

; ============================================================================
; 退出脚本
; ============================================================================
ExitScript:
	ExitApp
return

; ============================================================================
; 托盘菜单标签
; ============================================================================
ShowSettingsGUILabel:
	ShowSettingsGUI()
return

ShowStatisticsLabel:
	ShowStatistics()
return

; ============================================================================
; GUI 关闭事件（向后兼容旧的 GUI）
; ============================================================================
GuiClose:
GuiEscape:
	Gui, Destroy
return

ButtonOK:
	Gui, Submit
	SaveConfig()
	UpdateHotkeys()
return


; ============================================================================
; 加载 FindText 图像识别功能
; ============================================================================
#Include %A_ScriptDir%\lib\FindText.ahk
