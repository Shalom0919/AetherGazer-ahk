; ----------------------------------------------------------------------------
; 娜美自动战斗脚本
; Namei Auto Combat Script
; ----------------------------------------------------------------------------

#If WinActive("ahk_exe AetherGazer.exe") || WinActive("ahk_exe AetherGazer_Bili.exe")
Namei:
{
	if IsGameActive()
	{
		5_Enable := !5_Enable
		if (5_Enable = false)
		{
			SetTimer, Press5, Off
			ClearStatus()
		}
		else
		{
			Sleep 100
			Send, {%Skill1Key%}{%AttackKey%}
			SetTimer, Press5, 10
			ShowStatus("娜美：启动")
		}
	}
}

Press5:
	if CheckAndStopCombat(5, "Press5")
		return
	
	; 检测特殊状态并执行特殊连招 (Check special status and execute special combo)
	if IsSkillReady(1174, 684, "0xFFFFFF")
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
	
	; 基础连招 (Basic combo)
	Sleep 10
	Send, {%AttackKey%}
	
	; 条件使用技能2 (Conditional use of Skill2)
	if IsSkillReady(1090, 672, "0xFFFFFF")
	{
		Sleep 150
		Send, {%Skill2Key%}
	}
	
	Sleep 10
	Send, {%AttackKey%}
	
	; 条件使用技能1 (Conditional use of Skill1)
	if IsSkillReady(1016, 697, "0xFFFFFF")
	{
		Sleep 150
		Send, {%Skill1Key%}
	}
	
	; 奥义和队友技能 (Ultimate and teammate skills)
	SendCombo(["UltimateKey", "AttackKey", "Teammate1Key", "Teammate2Key"], 10)
return
