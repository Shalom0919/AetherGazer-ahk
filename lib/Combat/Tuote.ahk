; ----------------------------------------------------------------------------
; 托特/哈迪斯自动战斗脚本
; ----------------------------------------------------------------------------

global 4_Enable := false

Tuote:
{
	if WinActive("ahk_exe AetherGazer.exe") or WinActive("ahk_exe AetherGazer_Bili.exe")
	{
		4_Enable := !4_Enable
		if (4_Enable = false)
		{
			SetTimer, Press4, Off
			ToolTip
		}
		else
		{
			Sleep 100
			SetTimer, Press4, 10
			if (ShowTooltip)
				ToolTip, 托特/哈迪斯/雷前鬼/水姆：启动, %TooltipX%, %TooltipY%
		}
	}
}

Press4:
	if WinActive("ahk_exe AetherGazer.exe") or WinActive("ahk_exe AetherGazer_Bili.exe")
	{
		Send, {%AttackKey% Down}
		Sleep, 500
		Send, {%AttackKey% Up}
		Send, {%Skill3Key%}
		Sleep 10
		Send, {%Skill3Key%}
		Sleep 10
		Send, {%AttackKey%}
		Sleep 10
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
		Send, {%Teammate2Key%}
		Sleep 10
	}
	else
	{
		SetTimer, Press4, Off
		ToolTip
		4_Enable := false
	}
return
