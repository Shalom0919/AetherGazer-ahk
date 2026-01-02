; ----------------------------------------------------------------------------
; 娜美自动战斗脚本
; ----------------------------------------------------------------------------

global 5_Enable := false

Namei:
{
	if WinActive("ahk_exe AetherGazer.exe") or WinActive("ahk_exe AetherGazer_Bili.exe")
	{
		5_Enable := !5_Enable
		if (5_Enable = false)
		{
			SetTimer, Press5, Off
			ToolTip
		}
		else
		{
			Sleep 100
			Send, {%Skill1Key%}{%AttackKey%}
			SetTimer, Press5, 10
			if (ShowTooltip)
				ToolTip, 娜美：启动, %TooltipX%, %TooltipY%
		}
	}
}

Press5:
	if WinActive("ahk_exe AetherGazer.exe")
	{
		if (GetColor(1174, 684) == "0xFFFFFF")
		{
			Send, {%DodgeKey%}
			Sleep 400
			Send, {%AttackKey%}
			Sleep 300
			Send, {%AttackKey%}
			Sleep 700
			Send, {%AttackKey%}
			Sleep 600
			Send, {%Skill3Key%}
			Sleep 1400
			Send, {%Skill2Key%}{%Skill1Key%}
		}
		Sleep 10
		Send, {%AttackKey%}
		if (GetColor(1090, 672) == "0xFFFFFF")
		{
			Sleep 150
			Send, {%Skill2Key%}
		}
		Sleep 10
		Send, {%AttackKey%}
		if (GetColor(1016, 697) == "0xFFFFFF")
		{
			Sleep 150
			Send, {%Skill1Key%}
		}
		Send, {%UltimateKey%}
		Sleep 10
		Send, {%AttackKey%}
		Sleep 10
		Send, {%Teammate1Key%}
		Sleep 10
		Send, {%Teammate2Key%}
		Sleep 10
	}
	else
	{
		SetTimer, Press5, Off
		ToolTip
		5_Enable := false
	}
return
