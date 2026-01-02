; ----------------------------------------------------------------------------
; 陵光自动战斗脚本
; Lingguang Auto Combat Script
; ----------------------------------------------------------------------------

#If WinActive("ahk_exe AetherGazer.exe") || WinActive("ahk_exe AetherGazer_Bili.exe")
Lingguang:
{
	if IsGameActive()
	{
		3_Enable := !3_Enable
		if (3_Enable = false)
		{
			SetTimer, Press3, Off
			ClearStatus()
		}
		else
		{
			Sleep 100
			SetTimer, Press3, 10
			ShowStatus("陵光：启动")
		}
	}
}

Press3:
	if CheckAndStopCombat(3, "Press3")
		return
	
	Send, {%AttackKey%}
	Sleep 250
	Send, {%Skill1Key%}
	Sleep 250
	Send, {%UltimateKey%}
	Send, {%Teammate1Key%}
	Send, {%Teammate2Key%}
return
