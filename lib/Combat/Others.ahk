; ----------------------------------------------------------------------------
; 其他功能脚本（烤肉、连点器、樱切、亚莉莎）
; Other Features (Kaorou, Click Repeater, Yingqie, Yalisha)
; ----------------------------------------------------------------------------

; ============================================================================
; 闲暇时刻自动烤肉 (Auto Kaorou)
; ============================================================================

#If WinActive("ahk_exe AetherGazer.exe") || WinActive("ahk_exe AetherGazer_Bili.exe")
Kaorou:
{
if IsGameActive()
{
7_Enable := !7_Enable
if (7_Enable = false)
{
SetTimer, Press7, Off
ClearStatus()
}
else
{
Sleep 100
SetTimer, Press7, 10
ShowStatus("烤肉：启动")
}
}
}

Press7:
if CheckAndStopCombat(7, "Press7")
return

color := GetColor(691, 180)
if (IsColorClose(color, "0xde6566", 10))
{
Send, i
}
if (IsColorClose(color, "0x4abbf1", 10))
{
Send, u
}
return

; ============================================================================
; 简易连点器功能 (Simple Click Repeater)
; ============================================================================

RControl::
Input, Inputkey, L1 I V, {MouseX, MouseY}
9_Enable := true
loop
{
if IsGameActive()
{
if (9_Enable)
{
Send, %Inputkey%
Sleep, 50
ToolTip, %Inputkey% 键连点中，按%StopscriptKey%停止
}
if (!9_Enable or Inputkey = "")
{
ClearStatus()
break
}
}
else
{
9_Enable := false
ClearStatus()
break
}
}
return

Liandian:
{
if IsGameActive()
gosub, 连点弹框输入
return
}

连点弹框输入:
Gui, MouseClickGui:New
Gui, MouseClickGui:+AlwaysOnTop
Gui, MouseClickGui:Font, s9, Microsoft YaHei
Gui, MouseClickGui:Add, Text, , 填写连点的按键：`n同时连按多个按键直接填入即可，例如填入jkio为同时连点jkio四个按键`n特殊按键用{}圈住，例如鼠标左键为{LButton}，空格键为{Space}，左Shift为{LShift}
Gui, MouseClickGui:Add, Edit, w400 v连点按键, {LButton}
Gui, MouseClickGui:Add, Text, , 连点间隔（单位毫秒）：
Gui, MouseClickGui:Add, Edit, w400 v连点间隔, 50
Gui, MouseClickGui:Add, Button, default g连点确认, 确认
Gui, MouseClickGui:Show, , 按键连点
return

连点确认:
Gui, MouseClickGui:Submit
global WhichButton := 连点按键
global interval := 连点间隔
SetTimer, ContinuousClick, %连点间隔%
return

ContinuousClick:
if IsGameActive()
Send, %WhichButton%
ToolTip, %WhichButton%键连点中，`n间隔%interval%毫秒，按%StopscriptKey%停止
return

; ============================================================================
; 樱切（左线）自动战斗 (Yingqie Left Line Auto Combat)
; ============================================================================

#If WinActive("ahk_exe AetherGazer.exe") || WinActive("ahk_exe AetherGazer_Bili.exe")
Fengqianfangtiangou:
{
if IsGameActive()
{
13_Enable := !13_Enable
if (13_Enable = false)
{
ClearStatus()
}
else
{
Sleep 100
ShowStatus("樱切（左线）：启动")
gosub, Press13
}
}
}

Press13:
loop
{
if (!IsGameActive() or !13_Enable)
{
ClearStatus()
break
}

; 检测1技能是否为樱弥状态 (Check if Skill1 is in Yingmi state)
if IsSkillReady(1042, 682, "0xFFFFFF")
{
; 樱弥状态特殊连招 (Yingmi state special combo)
SendCombo(["Skill1Key", "Skill1Key", "Skill1Key"], 500)
SendCombo(["AttackKey", "AttackKey", "AttackKey"], 500)
SendCombo(["Skill2Key", "Skill2Key", "Skill2Key"], 500)
SendCombo(["AttackKey", "AttackKey", "AttackKey"], 500)
Send, {%Skill3Key%}
}

; 常规出招 (Regular combo)
if (!IsSkillReady(1042, 682, "0xFFFFFF") and !IsSkillReady(1154, 699, "0xFFFFFF"))
{
SendCombo(["Skill1Key", "Skill2Key", "Skill3Key", "UltimateKey", "AttackKey", "Teammate1Key", "Teammate2Key", "AttackKey"], 10)
}
}
return

; ============================================================================
; 亚莉莎（左线）自动战斗 (Yalisha Left Line Auto Combat)
; ============================================================================

#If WinActive("ahk_exe AetherGazer.exe") || WinActive("ahk_exe AetherGazer_Bili.exe")
Yalisha:
{
if IsGameActive()
{
14_Enable := !14_Enable
if (14_Enable = false)
{
ClearStatus()
}
else
{
Sleep 100
ShowStatus("亚莉莎（左线）：启动")
gosub, Press14
}
}
}

Press14:
loop
{
if (!IsGameActive() or !14_Enable)
{
ClearStatus()
break
}

; 检测是否处于枪械模式 (Check if in gun mode)
if (!IsSkillReady(1145, 672, "0xFFFFFF"))
{
; 进入枪械模式 (Enter gun mode)
Send, {%UpKey% Down}
Send, {%DodgeKey% Down}
Sleep, 500
Send, {%DodgeKey% Up}
Send, {%UpKey% Up}
}
else
{
; 开枪 (Shoot)
SendCombo(["AttackKey", "UltimateKey", "AttackKey", "Teammate1Key", "Teammate2Key"], 10)
}
}
return
