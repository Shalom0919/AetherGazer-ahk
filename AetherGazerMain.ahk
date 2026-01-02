; ----------------------------------------------------------------------------
; Script Name: 深空之眼 AHK 自动脚本 (最终完美版)
; ----------------------------------------------------------------------------
#Persistent
#SingleInstance, Force
ListLines, Off
SetBatchLines, -1
CoordMode, Menu, Window

; ============================================================================
; 1. 管理员权限检查
; ============================================================================
if !A_IsAdmin {
    try {
        if A_IsCompiled
            Run *RunAs "%A_ScriptFullPath%"
        else
            Run *RunAs "%A_AhkPath%" "%A_ScriptFullPath%"
    }
    ExitApp
}

; ============================================================================
; 2. 加载核心库 (纯逻辑/变量)
; ============================================================================
; 这些文件现在都没有 return 了，可以安全地按顺序加载
global ScriptDir := A_ScriptDir
global IniFilePath := ScriptDir . "\settings.ini"

#Include lib\Core\GlobalVars.ahk
#Include lib\Core\HotkeyManager.ahk
#Include lib\Config\KeyMappings.ahk
#Include lib\Config\Config.ahk
#Include lib\Utils\Utils.ahk
#Include lib\Statistics\Statistics.ahk

; ============================================================================
; 3. 执行初始化
; ============================================================================
InitScript()

; ★★★ 自动执行段结束 ★★★
return 

; ============================================================================
; 4. 初始化函数定义
; ============================================================================
InitScript()
{
    ; 1. 加载配置
    LoadConfig()
    
    ; 2. 加载统计数据
    if IsFunc("LoadStatistics")
        LoadStatistics()

    ; 3. 初始化托盘菜单
    InitTrayMenu()
    
    ; 4. 初始化热键
    InitHotkeys()
    
    ; 5. 显示悬浮窗 (现在它一定能出来了)
    if IsFunc("ShowFloatGUI")
        ShowFloatGUI()
    
    TrayTip, 深空之眼脚本, 脚本已启动, 3, 1
}

; ============================================================================
; 5. 加载带标签/热键的模块 (必须放在 Return 之后)
; ============================================================================

; GUI 界面 (包含 Label)
#Include lib\GUI\TrayMenu.ahk
#Include lib\GUI\SettingsGUI.ahk
#Include lib\GUI\FloatGUI.ahk

; 战斗逻辑 (包含 Hotkeys)
#Include lib\Combat\CombatBase.ahk
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
; 6. 底部事件处理
; ============================================================================
#If WinActive("ahk_exe AetherGazer.exe") || WinActive("ahk_exe AetherGazer_Bili.exe")
#If

Stopscript:
    Reload
return

GuiClose:
GuiEscape:
    Gui, Destroy
return

ButtonOK:
    Gui, Submit
    SaveConfig()
return

ExitScript:
    ExitApp
return

#Include lib\Vendor\FindText.ahk