; ----------------------------------------------------------------------------
; 托特/哈迪斯自动战斗脚本
; Tuote/Hadis Auto Combat Script
; ----------------------------------------------------------------------------

#If WinActive("ahk_exe AetherGazer.exe") || WinActive("ahk_exe AetherGazer_Bili.exe")
Tuote:
{
	if IsGameActive()
	{
		4_Enable := !4_Enable
		if (4_Enable = false)
		{
			SetTimer, Press4, Off
			ClearStatus()
		}
		else
		{
			Sleep 100
			SetTimer, Press4, 10
			ShowStatus("托特/哈迪斯/雷前鬼/水姆：启动")
		}
	}
}

Press4:
	if CheckAndStopCombat(4, "Press4")
		return
	
	; 长按普攻 (Hold Attack)
	SendKeyHold("AttackKey", 500)
	
	; 技能连招 (Skill combo)
	SendCombo(["Skill3Key", "Skill3Key", "AttackKey", "Skill1Key", "Skill1Key", "AttackKey", "Skill2Key", "UltimateKey", "AttackKey", "Teammate1Key", "Teammate2Key"], 10)
return
