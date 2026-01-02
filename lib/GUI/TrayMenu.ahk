; ----------------------------------------------------------------------------
; 托盘菜单模块
; Tray Menu Module
; ----------------------------------------------------------------------------

; 初始化托盘菜单 (Initialize Tray Menu)
InitTrayMenu()
{
	Menu, Tray, NoStandard
	Menu, Tray, Add, 快捷键设置, ShowSettingsGui
	Menu, Tray, Add, 退出程序, ExitScript
}
