; ----------------------------------------------------------------------------
; 梵天自动战斗脚本
; ----------------------------------------------------------------------------

global 11_Enable := false

Fantian:
{
	if WinActive("ahk_exe AetherGazer.exe") or WinActive("ahk_exe AetherGazer_Bili.exe")
	{
		11_Enable := !11_Enable
		if (11_Enable = false)
		{
			SetTimer, Press11, Off
			ToolTip
		}
		else
		{
			Sleep 100
			SetTimer, Press11, 10
			if (ShowTooltip)
				ToolTip, 梵天：启动, %TooltipX%, %TooltipY%
		}
	}
}

Press11:
	if WinActive("ahk_exe AetherGazer.exe") or WinActive("ahk_exe AetherGazer_Bili.exe")
	{
		if (GetColor(1218, 681) == "0xFFFFFF" and GetColor(910, 683) != "0xFFFFFF")
		{
			Send, {%DodgeKey% Down}
			Sleep, 500
			Send, {%DodgeKey% Up}
		}
		Send, {%Skill3Key%}
		Sleep 5
		Send, {%AttackKey%}
		Sleep 5
		Send, {%Skill1Key%}
		Sleep 5
		Send, {%UltimateKey%}
		Sleep 5
		Send, {%AttackKey%}
		Sleep 5
		Send, {%Skill2Key%}
		Sleep 5
		Send, {%Teammate2Key%}
		Sleep 5
		Send, {%Skill1Key%}
		Sleep 5
		Send, {%AttackKey%}
		Sleep 5
		Send, {%Skill2Key%}
		Sleep 5
	}
	else
	{
		SetTimer, Press11, Off
		ToolTip
		11_Enable := false
	}
return
