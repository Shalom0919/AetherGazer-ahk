; ----------------------------------------------------------------------------
; 诗寇蒂自动战斗脚本
; Shikoudi Auto Combat Script
; ----------------------------------------------------------------------------

#If WinActive("ahk_exe AetherGazer.exe") || WinActive("ahk_exe AetherGazer_Bili.exe")
Shikoudi:
{
	if IsGameActive()
	{
		12_Enable := !12_Enable
		if (12_Enable = false)
		{
			ClearStatus()
		}
		else
		{
			Sleep 100
			ShowStatus("诗寇蒂：启动")
			gosub, Press12
		}
	}
}

Press12:
	loop
	{
		if (!IsGameActive() or !12_Enable)
		{
			ClearStatus()
			break
		}
		
		; 优先检测技能3 - 左线、右线神格, 化身槽满, 长按3
		; (Priority check for Skill3 - left/right line marks, avatar gauge full, hold 3)
		if (GetColor(1157, 683) == "0xFFFFFF" and GetColor(1173, 695) == "0xFFFFFF" and GetColor(770, 609) == "0xFFFFFF")
		{
			SendKeyHold("Skill3Key", 10000)
			Sleep, 10
		}
		; 化身槽不满, 图标有两种形态 (Avatar gauge not full, icon has two forms)
		else if (GetColor(1157, 683) == "0xFFFFFF" or GetColor(1166, 668) == "0xFFFFFF" or GetColor(1143, 677) == "0xFFFFFF")
		{
			Send, {%Skill3Key%}
			Sleep, 10
		}
		; 其次检测技能2 (Then check Skill2)
		else if (GetColor(1097, 701) == "0xFFFFFF" and GetColor(1085, 700) == "0xFFFFFF")
		{
			Send, {%Skill2Key%}
			Sleep, 10
		}
		else
		{
			Send, {%AttackKey%}
			Sleep, 10
		}
		
		; 奥义和队友技能 (Ultimate and teammate skills)
		SendCombo(["UltimateKey", "Teammate1Key", "Teammate2Key"], 10)
	}
return
