; ----------------------------------------------------------------------------
; 全局变量定义模块
; Global Variables Definition Module
; AHK v1.1 兼容版本
; ----------------------------------------------------------------------------

; 战斗脚本状态标志 (Combat Script Status Flags)
; 使用原有的变量名保持向后兼容 (Using original variable names for backward compatibility)
global 1_Enable := false   ; 金乌 (Jinwu)
global 2_Enable := false   ; 多维变量 (Dimension)
global 3_Enable := false   ; 陵光 (Lingguang)
global 4_Enable := false   ; 托特/哈迪斯 (Tuote/Hadis)
global 5_Enable := false   ; 娜美 (Namei)
global 6_Enable := false   ; 薇儿 (Weier)
global 7_Enable := false   ; 烤肉 (Kaorou)
global 9_Enable := false   ; 连点器 (Liandian)
global 11_Enable := false  ; 梵天 (Fantian)
global 12_Enable := false  ; 诗寇蒂 (Shikoudi)
global 13_Enable := false  ; 樱切/风前方天勾 (Fengqianfangtiangou)
global 14_Enable := false  ; 亚莉莎 (Yalisha)

; 连点器相关变量 (Click Repeater Variables)
global Inputkey := ""
global WhichButton := ""
global interval := 50

; 当前运行的脚本名称
global CurrentCombatScript := ""

; ============================================================================
; 战斗标志管理函数 (Combat Flag Management Functions)
; 使用函数代替类，确保 AHK v1.1 兼容
; ============================================================================

; 获取指定ID的战斗标志状态 (Get combat flag status by ID)
GetCombatFlag(id)
{
    global
    varName := id . "_Enable"
    return %varName%
}

; 设置指定ID的战斗标志状态 (Set combat flag status by ID)
SetCombatFlag(id, value)
{
    global
    varName := id . "_Enable"
    %varName% := value
}

; 切换指定ID的战斗标志状态 (Toggle combat flag status by ID)
ToggleCombatFlag(id)
{
    global
    varName := id . "_Enable"
    %varName% := !%varName%
    return %varName%
}

; 重置所有战斗标志 (Reset All Combat Flags)
ResetAllCombatFlags()
{
    global
    1_Enable := false
    2_Enable := false
    3_Enable := false
    4_Enable := false
    5_Enable := false
    6_Enable := false
    7_Enable := false
    9_Enable := false
    11_Enable := false
    12_Enable := false
    13_Enable := false
    14_Enable := false
    Inputkey := ""
    CurrentCombatScript := ""
}

; 检查游戏是否激活 (Check if Game is Active)
IsGameActive()
{
    return WinActive("ahk_exe AetherGazer.exe") || WinActive("ahk_exe AetherGazer_Bili.exe")
}
