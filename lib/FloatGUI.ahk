; ----------------------------------------------------------------------------
; 浮动控制面板模块
; 提供可视化的脚本控制界面
; ----------------------------------------------------------------------------

; 全局变量
global FloatGUI_ScriptRunning := false
global FloatGUI_SelectedScript := ""

; 显示浮动控制面板
ShowFloatGUI()
{
	global
	
	; 销毁已存在的窗口
	Gui, FloatGUI:Destroy
	
	; 创建新的浮动窗口
	Gui, FloatGUI:New, +AlwaysOnTop -MinimizeBox +Caption
	Gui, FloatGUI:Font, s9, Microsoft YaHei
	
	; 添加标题
	Gui, FloatGUI:Font, s10 Bold
	Gui, FloatGUI:Add, Text, x10 y10 w260 Center, 深空之眼 - 控制面板
	Gui, FloatGUI:Font, s9 Norm
	
	; 分隔线
	Gui, FloatGUI:Add, Text, x10 y35 w260 h1 0x10
	
	; 战斗脚本选择
	Gui, FloatGUI:Add, GroupBox, x10 y45 w260 h80, 战斗脚本
	Gui, FloatGUI:Add, Text, x20 y65, 选择角色：
	Gui, FloatGUI:Add, DropDownList, x20 y85 w240 vFloatGUI_ScriptSelector, 金乌|陵光|托特/哈迪斯|娜美|薇儿|梵天|诗寇蒂|樱切|亚莉莎
	GuiControl, FloatGUI:Choose, FloatGUI_ScriptSelector, 1
	
	; 战斗脚本控制按钮
	Gui, FloatGUI:Add, Button, x20 y135 w115 h30 gFloatGUI_StartScript, 启动脚本
	Gui, FloatGUI:Add, Button, x145 y135 w115 h30 gFloatGUI_StopScript, 停止脚本
	
	; 功能按钮组
	Gui, FloatGUI:Add, GroupBox, x10 y175 w260 h120, 功能
	Gui, FloatGUI:Add, Button, x20 y195 w240 h30 gFloatGUI_StartDimension, 启动多维变量
	Gui, FloatGUI:Add, Button, x20 y230 w240 h30 gFloatGUI_OpenSettings, 打开设置
	Gui, FloatGUI:Add, Button, x20 y265 w240 h30 gFloatGUI_Exit, 退出程序
	
	; 状态栏
	Gui, FloatGUI:Add, Text, x10 y305 w260 h1 0x10
	Gui, FloatGUI:Add, Text, x10 y310 w260 vFloatGUI_StatusText Center, 状态：就绪
	
	; 显示窗口
	Gui, FloatGUI:Show, w280 h340, 深空之眼控制面板
}

; 启动选中的战斗脚本
FloatGUI_StartScript:
{
	Gui, FloatGUI:Submit, NoHide
	
	if (FloatGUI_ScriptRunning)
	{
		GuiControl, FloatGUI:, FloatGUI_StatusText, 状态：脚本已在运行中
		return
	}
	
	; 根据选择执行对应的脚本
	if (FloatGUI_ScriptSelector = "金乌")
	{
		FloatGUI_SelectedScript := "金乌"
		gosub, Jinwu
	}
	else if (FloatGUI_ScriptSelector = "陵光")
	{
		FloatGUI_SelectedScript := "陵光"
		gosub, Lingguang
	}
	else if (FloatGUI_ScriptSelector = "托特/哈迪斯")
	{
		FloatGUI_SelectedScript := "托特/哈迪斯"
		gosub, Tuote
	}
	else if (FloatGUI_ScriptSelector = "娜美")
	{
		FloatGUI_SelectedScript := "娜美"
		gosub, Namei
	}
	else if (FloatGUI_ScriptSelector = "薇儿")
	{
		FloatGUI_SelectedScript := "薇儿"
		gosub, Weier
	}
	else if (FloatGUI_ScriptSelector = "梵天")
	{
		FloatGUI_SelectedScript := "梵天"
		gosub, Fantian
	}
	else if (FloatGUI_ScriptSelector = "诗寇蒂")
	{
		FloatGUI_SelectedScript := "诗寇蒂"
		gosub, Shikoudi
	}
	else if (FloatGUI_ScriptSelector = "樱切")
	{
		FloatGUI_SelectedScript := "樱切"
		gosub, Fengqianfangtiangou
	}
	else if (FloatGUI_ScriptSelector = "亚莉莎")
	{
		FloatGUI_SelectedScript := "亚莉莎"
		gosub, Yalisha
	}
	
	FloatGUI_ScriptRunning := true
	GuiControl, FloatGUI:, FloatGUI_StatusText, 状态：%FloatGUI_SelectedScript% 脚本运行中
}
return

; 停止当前运行的脚本
FloatGUI_StopScript:
{
	if (!FloatGUI_ScriptRunning and FloatGUI_SelectedScript = "")
	{
		GuiControl, FloatGUI:, FloatGUI_StatusText, 状态：没有运行中的脚本
		return
	}
	
	gosub, Stopscript
	FloatGUI_ScriptRunning := false
	FloatGUI_SelectedScript := ""
	GuiControl, FloatGUI:, FloatGUI_StatusText, 状态：脚本已停止
}
return

; 启动多维变量模式
FloatGUI_StartDimension:
{
	GuiControl, FloatGUI:, FloatGUI_StatusText, 状态：多维变量模式启动中...
	gosub, Dimension
	GuiControl, FloatGUI:, FloatGUI_StatusText, 状态：多维变量模式运行中
}
return

; 打开设置界面
FloatGUI_OpenSettings:
{
	ShowSettingsGUI()
}
return

; 退出程序
FloatGUI_Exit:
{
	ExitApp
}
return

; 窗口关闭事件
FloatGUI:GuiClose:
FloatGUI:GuiEscape:
{
	; 最小化到托盘而不是关闭
	Gui, FloatGUI:Hide
}
return

; 显示浮动面板的函数
ShowFloatPanel()
{
	Gui, FloatGUI:Show
}

; 隐藏浮动面板的函数
HideFloatPanel()
{
	Gui, FloatGUI:Hide
}
