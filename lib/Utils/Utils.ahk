; ----------------------------------------------------------------------------
; 通用工具函数模块
; Utility Functions Module
; ----------------------------------------------------------------------------

; 获取指定坐标的颜色 (Get Color at Specified Coordinates)
; 参数 (Parameters):
;   x, y - 屏幕坐标 (Screen coordinates)
; 返回 (Returns): 颜色值，格式为 "0xRRGGBB" (Color value in format "0xRRGGBB")
GetColor(x, y)
{
	PixelGetColor, color, x, y, RGB
	StringRight color, color, 10
	return color
}

; 判断两个颜色值是否在容差范围内 (Check if Two Colors are Within Tolerance)
; 参数 (Parameters):
;   color1, color2 - 要比较的颜色值 (Colors to compare)
;   tolerance - 容差值 (0-255) (Tolerance value 0-255)
; 返回 (Returns): true/false
IsColorClose(color1, color2, tolerance)
{
	color1 := "0x" SubStr(color1, 3)
	color2 := "0x" SubStr(color2, 3)

	r1 := (color1 >> 16) & 0xFF
	g1 := (color1 >> 8) & 0xFF
	b1 := color1 & 0xFF

	r2 := (color2 >> 16) & 0xFF
	g2 := (color2 >> 8) & 0xFF
	b2 := color2 & 0xFF

	if (Abs(r1 - r2) <= tolerance && Abs(g1 - g2) <= tolerance && Abs(b1 - b2) <= tolerance)
	{
		return true
	}
	return false
}

; 显示状态提示 (Show Status Tooltip)
; 参数 (Parameters):
;   message - 要显示的消息 (Message to display)
;   x, y - 提示位置（可选，默认使用配置值）(Tooltip position, optional, uses config values by default)
ShowStatus(message, x := "", y := "")
{
	global ShowTooltip, TooltipX, TooltipY
	
	if (ShowTooltip)
	{
		if (x = "")
			x := TooltipX
		if (y = "")
			y := TooltipY
		ToolTip, %message%, %x%, %y%
	}
}

; 清除状态提示 (Clear Status Tooltip)
ClearStatus()
{
	ToolTip
}

; 发送按键并延迟 (Send Key with Delay)
; 参数 (Parameters):
;   key - 要发送的按键 (Key to send)
;   delay - 延迟时间（毫秒，可选，默认10ms）(Delay time in ms, optional, default 10ms)
SendKeyWithDelay(key, delay := 10)
{
	Send, {%key%}
	Sleep, %delay%
}

; 检查技能是否就绪 (Check if Skill is Ready)
; 通过检测指定坐标的颜色来判断技能是否可用
; (Checks if skill is available by detecting color at specified coordinates)
; 参数 (Parameters):
;   x, y - 技能图标位置 (Skill icon position)
;   checkColor - 就绪时的颜色（可选，默认为白色）(Ready state color, optional, default white)
; 返回 (Returns): true/false
IsSkillReady(x, y, checkColor := "0xFFFFFF")
{
	return (GetColor(x, y) == checkColor)
}

; 发送按键序列 (Send Key Sequence)
; 按顺序发送多个按键，每个按键之间有延迟
; (Sends multiple keys in sequence with delay between each)
; 参数 (Parameters):
;   keys - 按键数组 (Array of keys)
;   delay - 每个按键之间的延迟（毫秒，默认10ms）(Delay between keys in ms, default 10ms)
SendKeySequence(keys, delay := 10)
{
	for index, key in keys
	{
		Send, {%key%}
		Sleep, %delay%
	}
}

; 发送长按按键 (Send Key Hold)
; 按下按键，保持一段时间，然后释放
; (Press key, hold for duration, then release)
; 参数 (Parameters):
;   key - 要按下的按键 (Key to hold)
;   duration - 保持时间（毫秒）(Hold duration in ms)
SendKeyHold(key, duration)
{
	Send, {%key% Down}
	Sleep, %duration%
	Send, {%key% Up}
}

; 等待颜色出现 (Wait for Color to Appear)
; 等待指定坐标的颜色变为目标颜色
; (Waits for color at specified coordinates to match target color)
; 参数 (Parameters):
;   x, y - 坐标 (Coordinates)
;   targetColor - 目标颜色 (Target color)
;   timeout - 超时时间（毫秒，默认5000ms）(Timeout in ms, default 5000ms)
;   checkInterval - 检查间隔（毫秒，默认100ms）(Check interval in ms, default 100ms)
; 返回 (Returns): true 如果在超时前出现，false 如果超时 (true if appears before timeout, false if timeout)
WaitForColor(x, y, targetColor, timeout := 5000, checkInterval := 100)
{
	startTime := A_TickCount
	
	Loop
	{
		if (GetColor(x, y) == targetColor)
			return true
		
		if (A_TickCount - startTime > timeout)
			return false
		
		Sleep, %checkInterval%
	}
}

; 等待颜色消失 (Wait for Color to Disappear)
; 等待指定坐标的颜色不再是目标颜色
; (Waits for color at specified coordinates to change from target color)
; 参数 (Parameters):
;   x, y - 坐标 (Coordinates)
;   targetColor - 要消失的颜色 (Color to disappear)
;   timeout - 超时时间（毫秒，默认5000ms）(Timeout in ms, default 5000ms)
;   checkInterval - 检查间隔（毫秒，默认100ms）(Check interval in ms, default 100ms)
; 返回 (Returns): true 如果在超时前消失，false 如果超时 (true if disappears before timeout, false if timeout)
WaitForColorGone(x, y, targetColor, timeout := 5000, checkInterval := 100)
{
	startTime := A_TickCount
	
	Loop
	{
		if (GetColor(x, y) != targetColor)
			return true
		
		if (A_TickCount - startTime > timeout)
			return false
		
		Sleep, %checkInterval%
	}
}
