; ----------------------------------------------------------------------------
; 金乌自动战斗脚本
; ----------------------------------------------------------------------------

global 1_Enable := false

Jinwu:
{
	if WinActive("ahk_exe AetherGazer.exe") or WinActive("ahk_exe AetherGazer_Bili.exe")
	{
		1_Enable := !1_Enable
		if (1_Enable = false)
		{
			SetTimer, Press1, Off
			ToolTip
		}
		else
		{
			Sleep 100
			SetTimer, Press1, 10
			if (ShowTooltip)
				ToolTip, 金乌：启动, %TooltipX%, %TooltipY%
		}
	}
}

Press1:
	if WinActive("ahk_exe AetherGazer.exe") or WinActive("ahk_exe AetherGazer_Bili.exe")
	{
		loop
		{
			if (GetColor(1161, 692) == "0xFFFFFF")
			{
				Send, {%Skill3Key%}
				Sleep 10
				Send, {%Skill3Key%}
			}
			else
			{
				break
			}
		}
		Send, {%Skill1Key%}
		Sleep 10
		Send, {%Skill1Key%}
		Sleep 10
		Send, {%AttackKey%}
		Sleep 10
		Send, {%Skill2Key%}
		Sleep 10
		Send, {%UltimateKey%}
		Sleep 10
		Send, {%AttackKey%}
		Sleep 10
		Send, {%Teammate1Key%}
		Sleep 10
		Send, {%AttackKey%}
		Sleep 10
		Send, {%Teammate2Key%}
		Sleep 10
		Send, {%AttackKey%}
		Sleep 10
	}
	else
	{
		SetTimer, Press1, Off
		ToolTip
		1_Enable := false
	}
return
