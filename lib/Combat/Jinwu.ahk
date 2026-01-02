; ----------------------------------------------------------------------------
; 金乌自动战斗脚本
; Jinwu Auto Combat Script
; ----------------------------------------------------------------------------

#If WinActive("ahk_exe AetherGazer.exe") || WinActive("ahk_exe AetherGazer_Bili.exe")
Jinwu:
{
	if IsGameActive()
	{
		1_Enable := !1_Enable
		if (1_Enable = false)
		{
			SetTimer, Press1, Off
			ClearStatus()
		}
		else
		{
			Sleep 100
			SetTimer, Press1, 10
			ShowStatus("金乌：启动")
		}
	}
}

Press1:
	if CheckAndStopCombat(1, "Press1")
		return
	
	; 循环使用技能3直到不可用 (Loop Skill3 until unavailable)
	LoopSkillUse(1161, 692, "Skill3Key", "0xFFFFFF", 10)
	
	; 标准连招 (Standard combo)
	SendCombo(["Skill1Key", "Skill1Key", "AttackKey", "Skill2Key", "UltimateKey", "AttackKey", "Teammate1Key", "AttackKey", "Teammate2Key", "AttackKey"], 10)
return
