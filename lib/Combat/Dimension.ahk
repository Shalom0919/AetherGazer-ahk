; ----------------------------------------------------------------------------
; 多维变量自动刷分脚本
; Dimension Auto-farming Script
; 注意：此模块依赖主脚本中的 FindText 功能
; Note: This module depends on FindText functionality in the main script
; ----------------------------------------------------------------------------

#If WinActive("ahk_exe AetherGazer.exe") || WinActive("ahk_exe AetherGazer_Bili.exe")
Dimension:
	if IsGameActive()
	{
		2_Enable := !2_Enable
		if (2_Enable = false)
		{
			SetTimer, Press2, Off
			ClearStatus()
		}
		else
		{
			ShowStatus("多维变量：启动")
			Sleep 100
			Press2()
		}
	}
return

Press2()
{
	global
	
	if !IsGameActive()
	{
		SetTimer, Press2, Off
		ClearStatus()
		2_Enable := false
		return
	}
	
	CoordMode, Mouse, Window
	SendMode Input
	SetTitleMatchMode 2
	SetControlDelay 1
	SetWinDelay 0
	SetKeyDelay -1
	SetMouseDelay -1
	
	loop
	{
		;点击开始挑战
		Text:="|<>*204$83.zzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzjzzzzzwzz003sz7yD8znt7y007lwTwSFzbm7w00DXsbsYWT1aDz7lw1X7010y1CTyDXs36C121w20TwT7sYED647tk0TsyDl00SC8DnU3y003W00QCFzXVbs007AzzsM"
		ok:=FindText(X:="wait", Y:=-1, 0,0,0,0,0,0,Text)
		if (ok:=FindText(X, Y, 1075-150000, 770-150000, 1075+150000, 770+150000, 0, 0, Text))
		{
			FindText().Click(X, Y, "L")
		}
		;难度选择
		Sleep, 500
		Click, 562, 674 Left, Down
		Sleep, 78
		Click, 563, 659, 0
		Click, 563, 650, 0
		Sleep, 31
		Click, 556, 549, 0
		Click, 550, 507, 0
		Click, 543, 447, 0
		Sleep, 16
		Click, 542, 430, 0
		Click, 539, 395, 0
		Sleep, 16
		Click, 530, 128, 0
		Sleep, 15
		Click, 530, 89, 0
		Click, 536, -7, 0
		Sleep, 16
		Click, 542, -63, 0
		Click, 551, -120, 0
		Sleep, 15
		Click, 593, -169, 0
		Sleep, 16
		Click, 600, -169, 0
		Click, 600, -169 Left, Up
		Sleep, 812
		Click, 391, 630
		Sleep, 500
		Click, 1060, 662
		Sleep, 1000
		;选择真红
		Click, 71, 707
		Sleep, 500
		t1:=A_TickCount, Text:=X:=Y:=""
		Text:="|<>*211$37.0000000000000301U03zzknztzzsNzw0s0zjy7zsTzz30Q7TzVzy3rjUzz1tnkTzVzjwDzkwYY7zsSzz3zwDTzbzzVXb7zzknr0CD0MTUz3sBzwQ0Q6w60000000000004"
		if (ok:=FindText(X, Y, 163-150000, 267-150000, 163+150000, 267+150000, 0, 0, Text))
		{
			FindText().Click(X, Y, "L")
		}
		Sleep, 500
		Text:="|<>*206$41.0000000000000032000006A00Ty0gM0zzw1MztxqM3zzkngkDyZVbzUPPP3Dz0q6qTNa1gBgyzw0SqMtzs3vgkkA0DaNVUQ03NX3Dz06767jy0AQMz300Mnlnzw0l7U3zs00000000000004"
		if (ok:=FindText(X, Y, 162-150000, 416-150000, 162+150000, 416+150000, 0, 0, Text))
		{
			FindText().Click(X, Y, "L")
		}
		Sleep, 500
		Click, 235, 702
		Sleep, 500
		Text:="|<>*117$71.0Dzzzzzzzza00jzzzzzzzzi00PzzzzzzzzA0MbzzzzzzzzM1kCzTzzzxzzk348gjzzzzzzUCE03DzzjzzzETU04Izzzzzy1zU0N3yzzzzw3y0Am5nzzzzt7zLng/zzzzzwTzzzTzzzzzyAzzzzzzzzzzwNTzzzzzzzzzvnzzzzzzzz"
		if (ok:=FindText(X, Y, 161-150000, 436-150000, 161+150000, 436+150000, 0, 0, Text))
		{
			FindText().Click(X, Y, "L")
		}
		Sleep, 500
		Click, 1173, 701
		Sleep, 500
		;选择信标
		Click, 628, 562 Left, Down
		Sleep, 125
		Click, 628, 549, 0
		Click, 628, 546, 0
		Sleep, 16
		Click, 628, 521, 0
		Click, 628, 508, 0
		Sleep, 16
		Click, 628, 457, 0
		Click, 628, 436, 0
		Sleep, 15
		Click, 628, 362, 0
		Click, 628, 335, 0
		Sleep, 16
		Click, 626, 240, 0
		Click, 626, 224, 0
		Sleep, 15
		Click, 619, -9, 0
		Click, 618, -54, 0
		Sleep, 16
		Click, 618, -110, 0
		Sleep, 16
		Click, 618, -110 Left, Up
		Sleep, 812
		Click, 170, 492
		Sleep, 500
		Click, 483, 221
		Sleep, 500
		Click, 805, 221
		Sleep, 500
		Click, 1183, 702
		Sleep, 500
		;选珍宝
		Text:="|<>*167$45.zzzzzzzzzzzzzzzzzrzzzzzzwTwzXzw10DXwTzU81wDXzyCADlwTzlU0zTXzyA07zwTzk00kTXzw28a3sTzUE0sT1zsG07XsDz2E0wT1zsG8bWl7zmE0w68zyG07U3Xzk3Aw0QDy0NbW7kzk30yFz7zws7yTxzzzzzzzzzzzzzzzzz"
		ok:=FindText(X:="wait", Y:=-1, 0,0,0,0,0,0,Text)
		if (ok:=FindText(X, Y, 886-150000, 742-150000, 886+150000, 742+150000, 0, 0, Text))
		{
			Click, 642, 400
			Sleep, 500
			FindText().Click(X, Y, "L")
		}
		Sleep, 500
		Click, 864, 643
		;选关卡
		Sleep, 1687
		Send, {w Down}
		Sleep, 3300
		Send, {d Down}
		Sleep, 1200
		Send, {d Up}
		Sleep, 400
		Send, {w Up}
		Sleep, 1000
		Click, 889, 490
		Sleep, 500
		;打完只有一个珍宝时，确认默认被选中时的图片
		text1:="|<>*202$43.zzzzzzzzzzzzzzzzrzzzzzzlztyDz0M3sT7zU81yDXzwMEz3lzyM0DnszyA03zwTz001UyDz0W8kT3zUE0QDVzV80D7UzkYF7XkDwG8Xls7z901s8lzYU0w0MzkF4S4SDs1WD4T3w0k7YDlzws7zDwzzzzzzzzzzzzzzzzzzzzzzz"
		;打怪
		loop
		{
			if WinActive("ahk_exe AetherGazer.exe") or WinActive("ahk_exe AetherGazer_Bili.exe")
				Send, {%Skill1Key%}
			Sleep, 10
			Send, {%Skill3Key%}
			Sleep, 10
			Send, {%AttackKey%}
			Sleep, 10
			Send, {%Skill2Key%}
			Sleep, 10
			Send, {%Skill3Key%}
			Sleep, 10
			Send, {%AttackKey%}
			Sleep, 10
			Send, {%UltimateKey%}
			Sleep, 10
			Send, {%Skill3Key%}
			Sleep, 10
			Send, {%AttackKey%}
			Sleep, 10
			if (ok:=FindText(X, Y, 886-150000, 742-150000, 886+150000, 742+150000, 0, 0, Text))
			{
				break
			}
			if (ok:=FindText(X, Y, 886-150000, 742-150000, 886+150000, 742+150000, 0, 0, Text1))
			{
				break
			}
		}
		Click, 642, 400
		Sleep, 500
		Click, 745, 643
		Sleep, 1000
		;退出
		Send, {Alt}
		Sleep, 500
		Click, 1229, 74
		Sleep, 500
		Click, 1000, 692
		Sleep, 500
		Send, {Enter}
		Text:="|<>*202$39.zzzzzzzzzzzzzvzzzwzyA0DzbzkU1wwsz0TDbb7wU1wwszw0Dbb7kXtw00w40DU07kU0w00z4F7zbzsW1swwT4ED7bXsUEswwT07b7bXk3ws00QE03003nU0s00Tzzzzzbzzzzzzw"
		ok:=FindText(X:="wait", Y:=-1, 0,0,0,0,0,0,Text)
		if (ok:=FindText(X, Y, 1183-150000, 803-150000, 1183+150000, 803+150000, 0, 0, Text))
		{
			FindText().Click(X, Y, "L")
		}
		Sleep, 1000
	}
}
