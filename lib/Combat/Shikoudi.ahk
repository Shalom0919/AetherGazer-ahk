; ----------------------------------------------------------------------------
; 诗寇蒂自动战斗脚本
; ----------------------------------------------------------------------------

global 12_Enable := false

Shikoudi:
{
	if WinActive("ahk_exe AetherGazer.exe") or WinActive("ahk_exe AetherGazer_Bili.exe")
	{
		12_Enable := !12_Enable
		if (12_Enable = false)
		{
			ToolTip
		}
		else
		{
			Sleep 100
			if (ShowTooltip)
				ToolTip, 诗寇蒂：启动, %TooltipX%, %TooltipY%
			gosub, Press12
		}
	}
}

Press12:
	loop
	{
		if (!WinActive("ahk_exe AetherGazer.exe") and !WinActive("ahk_exe AetherGazer_Bili.exe") or !12_Enable)
		{
			ToolTip
			break
		}
		; 优先检测技能3
		if (GetColor(1157, 683) == "0xFFFFFF" and GetColor(1173, 695) == "0xFFFFFF" and GetColor(770, 609) == "0xFFFFFF")
		{
			; 左线、右线神格, 化身槽满, 长按3
			Send, {%Skill3Key% Down}
			Sleep, 10000
			Send, {%Skill3Key% Up}
			Sleep, 10
		}
		else if (GetColor(1157, 683) == "0xFFFFFF" or GetColor(1166, 668) == "0xFFFFFF" or GetColor(1143, 677) == "0xFFFFFF")
		{
			; 化身槽不满, 图标有两种形态
			Send, {%Skill3Key%}
			Sleep, 10
		}
		; 其次检测技能2
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
		Send, {%UltimateKey%}
		Sleep, 10
		Send, {%Teammate1Key%}
		Sleep, 10
		Send, {%Teammate2Key%}
		Sleep, 10
	}
return
