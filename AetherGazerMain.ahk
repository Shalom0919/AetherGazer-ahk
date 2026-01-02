; ----------------------------------------------------------------------------
; Script Name: 深空之眼 AHK 自动脚本
; Version: 4.0 (模块化重构版)
; Author: qstdnx (原作者), Shalom0919 (模块化重构)
; Repository: https://github.com/Shalom0919/AetherGazer-ahk
; ----------------------------------------------------------------------------

; ============================================================================
; 脚本基础设置 (Script Basic Settings)
; ============================================================================
#Persistent             ; 让脚本持久运行 (Keep script persistent)
#SingleInstance, Force  ; 运行替换旧实例 (Force replace old instance)
ListLines, Off          ; 不显示最近执行的脚本行 (Don't show recent script lines)
SetBatchLines, -1       ; 脚本全速执行(默认10ms) (Script runs at full speed)
CoordMode, Menu, Window ; 坐标相对活动窗口 (Coordinates relative to active window)

; ============================================================================
; 管理员权限检查 (Administrator Privilege Check)
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
MsgBox, 管理员权限请求被拒绝，脚本需要使用管理员权限运行
ExitApp
}
}

; ============================================================================
; 全局变量初始化 (Global Variables Initialization)
; ============================================================================
global ScriptDir := A_ScriptDir
global IniFilePath := ScriptDir . "\settings.ini"

; ============================================================================
; 加载核心模块 (Load Core Modules)
; ============================================================================
#Include lib\Core\GlobalVars.ahk
#Include lib\Core\HotkeyManager.ahk

; ============================================================================
; 加载配置模块 (Load Configuration Modules)
; ============================================================================
#Include lib\Config\KeyMappings.ahk
#Include lib\Config\Config.ahk

; ============================================================================
; 加载工具模块 (Load Utility Modules)
; ============================================================================
#Include lib\Utils\Utils.ahk

; ============================================================================
; 加载GUI模块 (Load GUI Modules)
; ============================================================================
#Include lib\GUI\TrayMenu.ahk
#Include lib\GUI\SettingsGUI.ahk
#Include lib\GUI\FloatGUI.ahk

; ============================================================================
; 加载统计模块 (Load Statistics Module)
; ============================================================================
#Include lib\Statistics\Statistics.ahk

; ============================================================================
; 加载第三方库 (Load Third-party Libraries)
; ============================================================================
#Include lib\Vendor\FindText.ahk

; ============================================================================
; 加载战斗基类 (Load Combat Base)
; ============================================================================
#Include lib\Combat\CombatBase.ahk

; ============================================================================
; 加载战斗脚本 (Load Combat Scripts)
; ============================================================================
#Include lib\Combat\Jinwu.ahk
#Include lib\Combat\Lingguang.ahk
#Include lib\Combat\Tuote.ahk
#Include lib\Combat\Namei.ahk
#Include lib\Combat\Weier.ahk
#Include lib\Combat\Fantian.ahk
#Include lib\Combat\Shikoudi.ahk
#Include lib\Combat\Others.ahk
#Include lib\Combat\Dimension.ahk

; ============================================================================
; 脚本初始化 (Script Initialization)
; ============================================================================
InitScript()
{
; 加载配置 (Load configuration)
LoadConfig()

; 初始化托盘菜单 (Initialize tray menu)
InitTrayMenu()

; 初始化热键 (Initialize hotkeys)
InitHotkeys()

; 显示启动消息 (Show startup message)
TrayTip, 深空之眼脚本, 脚本已启动，使用热键控制各功能, 3, 1
}

; 调用初始化 (Call initialization)
InitScript()

; ============================================================================
; 游戏窗口激活时的设置 (Settings when Game Window is Active)
; ============================================================================
#If WinActive("ahk_exe AetherGazer.exe") || WinActive("ahk_exe AetherGazer_Bili.exe")
SysGet, VirtualWidth, 16
SysGet, VirtualHeight, 17
CoordMode, ToolTip, Screen

; ============================================================================
; 全局停止热键 (Global Stop Hotkey)
; ============================================================================
#If WinActive("ahk_exe AetherGazer.exe") || WinActive("ahk_exe AetherGazer_Bili.exe")
Stopscript:
Reload
ResetAllCombatFlags()
return

; ============================================================================
; GUI事件处理 (GUI Event Handlers)
; ============================================================================
GuiClose:
GuiEscape:
Gui, Destroy
return

ButtonOK:
Gui, Submit
SaveConfig()
return

; ============================================================================
; 退出脚本 (Exit Script)
; ============================================================================
ExitScript:
ExitApp
return

; ============================================================================
; 脚本结束 (Script End)
; ============================================================================
