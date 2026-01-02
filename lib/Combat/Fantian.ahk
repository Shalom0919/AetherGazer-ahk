; ----------------------------------------------------------------------------
; 梵天自动战斗脚本
; Fantian Auto Combat Script
; ----------------------------------------------------------------------------

#If WinActive("ahk_exe AetherGazer.exe") || WinActive("ahk_exe AetherGazer_Bili.exe")
Fantian:
{
	if IsGameActive()
	{
		11_Enable := !11_Enable
		if (11_Enable = false)
		{
			SetTimer, Press11, Off
			ClearStatus()
		}
		else
		{
			Sleep 100
			SetTimer, Press11, 10
			ShowStatus("梵天：启动")
		}
	}
}

Press11:
	if CheckAndStopCombat(11, "Press11")
		return
	
	; 检测是否需要闪避 (Check if dodge is needed)
	if (GetColor(1218, 681) == "0xFFFFFF" and GetColor(910, 683) != "0xFFFFFF")
	{
		SendKeyHold("DodgeKey", 500)
	}
	
	; 快速连招 (Quick combo)
	SendCombo(["Skill3Key", "AttackKey", "Skill1Key", "UltimateKey", "AttackKey", "Skill2Key", "Teammate2Key", "Skill1Key", "AttackKey", "Skill2Key"], 5)
return
