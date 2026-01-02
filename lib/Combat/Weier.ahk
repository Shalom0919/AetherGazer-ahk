; ----------------------------------------------------------------------------
; 薇儿/光赫拉/瓦吉特/执明自动战斗脚本
; ----------------------------------------------------------------------------

global 6_Enable := false

Weier:
{
	if WinActive("ahk_exe AetherGazer.exe") or WinActive("ahk_exe AetherGazer_Bili.exe")
	{
		6_Enable := !6_Enable
		if (6_Enable = false)
		{
			SetTimer, Press6, Off
			ToolTip
		}
		else
		{
			Sleep 100
			SetTimer, Press6, 10
			if (ShowTooltip)
				ToolTip, 薇儿/光赫拉/瓦吉特/执明：启动, %TooltipX%, %TooltipY%
		}
	}
}

Press6:
	if WinActive("ahk_exe AetherGazer.exe") or WinActive("ahk_exe AetherGazer_Bili.exe")
	{
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
		Send, {%Teammate1Key%}
		Sleep 5
		Send, {%Skill1Key%}
		Sleep 5
		Send, {%Teammate2Key%}
		Sleep 5
		Send, {%Skill2Key%}
		Sleep 5
	}
	else
	{
		SetTimer, Press6, Off
		ToolTip
		6_Enable := false
	}
return
