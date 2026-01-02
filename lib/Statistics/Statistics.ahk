; ----------------------------------------------------------------------------
; 统计功能模块
; ----------------------------------------------------------------------------

; 全局统计变量
global TotalRuns := 0
global TotalTime := 0
global LastRunTime := ""
global SessionRuns := 0
global SessionStartTime := A_TickCount

; 加载统计数据
LoadStatistics()
{
	global
	IniRead, TotalRuns, %ConfigFilePath%, Statistics, TotalRuns, 0
	IniRead, TotalTime, %ConfigFilePath%, Statistics, TotalTime, 0
	IniRead, LastRunTime, %ConfigFilePath%, Statistics, LastRunTime, 
	SessionRuns := 0
	SessionStartTime := A_TickCount
}

; 保存统计数据
SaveStatistics()
{
	global
	IniWrite, %TotalRuns%, %ConfigFilePath%, Statistics, TotalRuns
	IniWrite, %TotalTime%, %ConfigFilePath%, Statistics, TotalTime
	IniWrite, %LastRunTime%, %ConfigFilePath%, Statistics, LastRunTime
}

; 记录一次运行
RecordRun(duration := 0)
{
	global
	TotalRuns++
	SessionRuns++
	TotalTime += duration
	FormatTime, LastRunTime, , yyyy-MM-dd HH:mm:ss
	SaveStatistics()
}

; 重置统计数据
ResetStatistics()
{
	global
	MsgBox, 36, 确认重置, 确定要重置所有统计数据吗？
	IfMsgBox Yes
	{
		TotalRuns := 0
		TotalTime := 0
		LastRunTime := ""
		SessionRuns := 0
		SessionStartTime := A_TickCount
		SaveStatistics()
		MsgBox, 64, 重置成功, 所有统计数据已重置
	}
}

; 获取格式化的运行时长
GetFormattedTime(seconds)
{
	hours := Floor(seconds / 3600)
	minutes := Floor(Mod(seconds, 3600) / 60)
	secs := Mod(seconds, 60)
	return Format("{:d}h {:d}m {:d}s", hours, minutes, secs)
}

; 获取当前会话时长
GetSessionDuration()
{
	global SessionStartTime
	return Floor((A_TickCount - SessionStartTime) / 1000)
}

; 显示统计信息窗口
ShowStatistics()
{
	global
	sessionDuration := GetSessionDuration()
	
	Gui, StatsGui:New
	Gui, StatsGui:Font, s10, Microsoft YaHei
	Gui, StatsGui:Add, GroupBox, x10 y10 w380 h120, 总体统计
	Gui, StatsGui:Add, Text, x20 y35, 总运行次数：
	Gui, StatsGui:Add, Text, x150 y35, %TotalRuns% 次
	Gui, StatsGui:Add, Text, x20 y60, 总运行时长：
	Gui, StatsGui:Add, Text, x150 y60, % GetFormattedTime(TotalTime)
	Gui, StatsGui:Add, Text, x20 y85, 最后运行时间：
	Gui, StatsGui:Add, Text, x150 y85, %LastRunTime%
	
	Gui, StatsGui:Add, GroupBox, x10 y140 w380 h80, 当前会话统计
	Gui, StatsGui:Add, Text, x20 y165, 会话运行次数：
	Gui, StatsGui:Add, Text, x150 y165, %SessionRuns% 次
	Gui, StatsGui:Add, Text, x20 y190, 会话时长：
	Gui, StatsGui:Add, Text, x150 y190, % GetFormattedTime(sessionDuration)
	
	Gui, StatsGui:Add, Button, x10 y230 w380 h30 gResetStatistics, 重置统计数据
	Gui, StatsGui:Show, w400 h280, 统计信息
}

StatsGuiClose:
StatsGuiEscape:
	Gui, StatsGui:Destroy