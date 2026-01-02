; ----------------------------------------------------------------------------
; 通用工具函数模块
; ----------------------------------------------------------------------------

; 获取指定坐标的颜色
GetColor(x, y)
{
	PixelGetColor, color, x, y, RGB
	StringRight color, color, 10
	return color
}

; 判断两个颜色值是否在容差范围内
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
