; ----------------------------------------------------------------------------
; 薇儿/光赫拉/瓦吉特/执明自动战斗脚本
; Weier/Guanghela/Wajite/Zhiming Auto Combat Script
; ----------------------------------------------------------------------------

#If WinActive("ahk_exe AetherGazer.exe") || WinActive("ahk_exe AetherGazer_Bili.exe")
Weier:
{
	if IsGameActive()
	{
		6_Enable := !6_Enable
		if (6_Enable = false)
		{
			SetTimer, Press6, Off
			ClearStatus()
		}
		else
		{
			Sleep 100
			SetTimer, Press6, 10
			ShowStatus("薇儿/光赫拉/瓦吉特/执明：启动")
		}
	}
}

Press6:
	if CheckAndStopCombat(6, "Press6")
		return
	
	; 快速连招 (Quick combo)
	SendCombo(["Skill3Key", "AttackKey", "Skill1Key", "UltimateKey", "AttackKey", "Skill2Key", "Teammate1Key", "Skill1Key", "Teammate2Key", "Skill2Key"], 5)
return
