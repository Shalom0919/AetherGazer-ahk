; ----------------------------------------------------------------------------
; 陵光自动战斗脚本
; ----------------------------------------------------------------------------

global 3_Enable := false

Lingguang:
{
	if WinActive("ahk_exe AetherGazer.exe") or WinActive("ahk_exe AetherGazer_Bili.exe")
	{
		3_Enable := !3_Enable
		if (3_Enable = false)
		{
			SetTimer, Press3, Off
			ToolTip
		}
		else
		{
			Sleep 100
			SetTimer, Press3, 10
			if (ShowTooltip)
				ToolTip, 陵光：启动, %TooltipX%, %TooltipY%
		}
	}
}

Press3:
	if WinActive("ahk_exe AetherGazer.exe") or WinActive("ahk_exe AetherGazer_Bili.exe")
	{
		Send, {%AttackKey%}
		Sleep 250
		Send, {%Skill1Key%}
		Sleep 250
		Send, {%UltimateKey%}
		Send, {%Teammate1Key%}
		Send, {%Teammate2Key%}
	}
	else
	{
		SetTimer, Press3, Off
		ToolTip
		3_Enable := false
	}
return
