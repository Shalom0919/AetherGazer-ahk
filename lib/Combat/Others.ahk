; ----------------------------------------------------------------------------
; 其他功能脚本（烤肉、连点器、樱切、亚莉莎）
; ----------------------------------------------------------------------------

; ============================================================================
; 闲暇时刻自动烤肉
; ============================================================================
global 7_Enable := false

Kaorou:
{
	if WinActive("ahk_exe AetherGazer.exe") or WinActive("ahk_exe AetherGazer_Bili.exe")
	{
		7_Enable := !7_Enable
		if (7_Enable = false)
		{
			SetTimer, Press7, Off
			ToolTip
		}
		else
		{
			Sleep 100
			SetTimer, Press7, 10
			if (ShowTooltip)
				ToolTip, 烤肉：启动, %TooltipX%, %TooltipY%
		}
	}
}

Press7:
	if WinActive("ahk_exe AetherGazer.exe") or WinActive("ahk_exe AetherGazer_Bili.exe")
	{
		color := GetColor(691, 180)
		if (IsColorClose(color, "0xde6566", 10))
		{
			Send, i
		}
		if (IsColorClose(color, "0x4abbf1", 10))
		{
			Send, u
		}
	}
	else
	{
		SetTimer, Press7, Off
		ToolTip
		7_Enable := false
	}
return

; ============================================================================
; 简易连点器功能
; ============================================================================
global 9_Enable := false
global Inputkey := ""

RControl::
	Input, Inputkey, L1 I V, {MouseX, MouseY}
	9_Enable := true
	loop
	{
		if WinActive("ahk_exe AetherGazer.exe") or WinActive("ahk_exe AetherGazer_Bili.exe")
		{
			if (9_Enable)
			{
				Send, %Inputkey%
				Sleep, 50
				ToolTip, %Inputkey% 键连点中，按%StopscriptKey%停止
			}
			if (!9_Enable or Inputkey = "")
			{
				ToolTip
				break
			}
		}
		else
		{
			9_Enable := false
			ToolTip
			break
		}
	}
return

Liandian:
{
	if WinActive("ahk_exe AetherGazer.exe") or WinActive("ahk_exe AetherGazer_Bili.exe")
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
	if WinActive("ahk_exe AetherGazer.exe") or WinActive("ahk_exe AetherGazer_Bili.exe")
		Send, %WhichButton%
	ToolTip, %WhichButton%键连点中，`n间隔%interval%毫秒，按%StopscriptKey%停止
return

; ============================================================================
; 樱切（左线）自动战斗
; ============================================================================
global 13_Enable := false

Fengqianfangtiangou:
{
	if WinActive("ahk_exe AetherGazer.exe") or WinActive("ahk_exe AetherGazer_Bili.exe")
	{
		13_Enable := !13_Enable
		if (13_Enable = false)
		{
			ToolTip
		}
		else
		{
			Sleep 100
			if (ShowTooltip)
				ToolTip, 樱切（左线）：启动, %TooltipX%, %TooltipY%
			gosub, Press13
		}
	}
}

Press13:
	loop
	{
		if (!WinActive("ahk_exe AetherGazer.exe") and !WinActive("ahk_exe AetherGazer_Bili.exe") or !13_Enable)
		{
			ToolTip
			break
		}
		; 检测1技能是否为樱弥状态
		if (GetColor(1042, 682) == "0xFFFFFF")
		{
			Send, {%Skill1Key%}
			Sleep, 500
			Send, {%Skill1Key%}
			Sleep, 500
			Send, {%Skill1Key%}
			Sleep, 500
			Send, {%AttackKey%}
			Sleep, 500
			Send, {%AttackKey%}
			Sleep, 500
			Send, {%AttackKey%}
			Sleep, 500
			Send, {%Skill2Key%}
			Sleep, 500
			Send, {%Skill2Key%}
			Sleep, 500
			Send, {%Skill2Key%}
			Sleep, 500
			Send, {%AttackKey%}
			Sleep, 500
			Send, {%AttackKey%}
			Sleep, 500
			Send, {%AttackKey%}
			Sleep, 500
			Send, {%Skill3Key%}
		}
		; 常规出招
		if (GetColor(1042, 682) != "0xFFFFFF" and GetColor(1154, 699) != "0xFFFFFF")
		{
			Send, {%Skill1Key%}
			Sleep, 10
			Send, {%Skill2Key%}
			Sleep, 10
			Send, {%Skill3Key%}
			Sleep, 10
			Send, {%UltimateKey%}
			Sleep, 10
			Send, {%AttackKey%}
			Sleep, 10
			Send, {%Teammate1Key%}
			Sleep, 10
			Send, {%Teammate2Key%}
			Sleep, 10
			Send, {%AttackKey%}
		}
	}
return

; ============================================================================
; 亚莉莎（左线）自动战斗
; ============================================================================
global 14_Enable := false

Yalisha:
{
	if WinActive("ahk_exe AetherGazer.exe") or WinActive("ahk_exe AetherGazer_Bili.exe")
	{
		14_Enable := !14_Enable
		if (14_Enable = false)
		{
			ToolTip
		}
		else
		{
			Sleep 100
			if (ShowTooltip)
				ToolTip, 亚莉莎（左线）：启动, %TooltipX%, %TooltipY%
			gosub, Press14
		}
	}
}

Press14:
	loop
	{
		if (!WinActive("ahk_exe AetherGazer.exe") and !WinActive("ahk_exe AetherGazer_Bili.exe") or !14_Enable)
		{
			ToolTip
			break
		}
		; 检测是否处于枪械模式
		if (GetColor(1145, 672) != "0xFFFFFF")
		{
			Send, {%UpKey% Down}
			Send, {%DodgeKey% Down}
			Sleep, 500
			Send, {%DodgeKey% Up}
			Send, {%UpKey% Up}
		}
		; 否则，开枪
		else
		{
			Send, {%AttackKey%}
			Sleep, 10
			Send, {%UltimateKey%}
			Sleep, 10
			Send, {%AttackKey%}
			Sleep, 10
			Send, {%Teammate1Key%}
			Sleep, 10
			Send, {%Teammate2Key%}
		}
	}
return
