; ----------------------------------------------------------------------------
; 配置管理模块
; Configuration Management Module
; ----------------------------------------------------------------------------

; 初始化配置文件路径
global ConfigFilePath := A_ScriptDir . "\settings.ini"

; 加载配置 (Load Configuration)
LoadConfig()
{
global
DefaultKeys := GetDefaultKeyMappings()

; 检查 INI 文件是否存在
if !FileExist(ConfigFilePath)
{
CreateDefaultConfig()
}

; 加载所有配置
for key, defaultValue in DefaultKeys
{
IniRead, ReadValue, %ConfigFilePath%, Hotkeys, %key%
if (ReadValue = "ERROR")
{
IniWrite, %defaultValue%, %ConfigFilePath%, Hotkeys, %key%
ReadValue := defaultValue
}
%key% := ReadValue
}

; 加载通用设置
IniRead, Resolution, %ConfigFilePath%, General, Resolution, 1280x720
IniRead, ShowTooltip, %ConfigFilePath%, General, ShowTooltip, 1
IniRead, TooltipX, %ConfigFilePath%, General, TooltipX, 74
IniRead, TooltipY, %ConfigFilePath%, General, TooltipY, 1021
IniRead, ScriptDelay, %ConfigFilePath%, General, ScriptDelay, 10
IniRead, MinimizeToTray, %ConfigFilePath%, General, MinimizeToTray, 0
IniRead, AutoStart, %ConfigFilePath%, General, AutoStart, 0

; 加载多维变量设置
IniRead, DimensionDifficulty, %ConfigFilePath%, Dimension, Difficulty, 20
IniRead, DimensionAutoSelect, %ConfigFilePath%, Dimension, AutoSelectCharacter, 1
IniRead, DimensionAutoBeacon, %ConfigFilePath%, Dimension, AutoSelectBeacon, 1
IniRead, DimensionRetry, %ConfigFilePath%, Dimension, AutoRetry, 0
IniRead, DimensionAutoExit, %ConfigFilePath%, Dimension, AutoExit, 0
IniRead, DimensionMaxRuns, %ConfigFilePath%, Dimension, MaxRuns, 0
}

; 创建默认配置文件 (Create Default Configuration File)
CreateDefaultConfig()
{
global
DefaultKeys := GetDefaultKeyMappings()

; 写入所有默认按键
for key, value in DefaultKeys
{
IniWrite, %value%, %ConfigFilePath%, Hotkeys, %key%
}

; 写入通用设置
IniWrite, 1280x720, %ConfigFilePath%, General, Resolution
IniWrite, 1, %ConfigFilePath%, General, ShowTooltip
IniWrite, 74, %ConfigFilePath%, General, TooltipX
IniWrite, 1021, %ConfigFilePath%, General, TooltipY
IniWrite, 10, %ConfigFilePath%, General, ScriptDelay
IniWrite, 0, %ConfigFilePath%, General, MinimizeToTray
IniWrite, 0, %ConfigFilePath%, General, AutoStart

; 写入多维变量设置
IniWrite, 20, %ConfigFilePath%, Dimension, Difficulty
IniWrite, 1, %ConfigFilePath%, Dimension, AutoSelectCharacter
IniWrite, 1, %ConfigFilePath%, Dimension, AutoSelectBeacon
IniWrite, 0, %ConfigFilePath%, Dimension, AutoRetry
IniWrite, 0, %ConfigFilePath%, Dimension, AutoExit
IniWrite, 0, %ConfigFilePath%, Dimension, MaxRuns

; 初始化统计数据
IniWrite, 0, %ConfigFilePath%, Statistics, TotalRuns
IniWrite, 0, %ConfigFilePath%, Statistics, TotalTime
IniWrite, N/A, %ConfigFilePath%, Statistics, LastRunTime
}

; 保存配置 (Save Configuration)
SaveConfig()
{
global
DefaultKeys := GetDefaultKeyMappings()

; 保存所有按键配置
for key, value in DefaultKeys
{
keyValue := %key%
IniWrite, %keyValue%, %ConfigFilePath%, Hotkeys, %key%
}

; 保存通用设置
IniWrite, %Resolution%, %ConfigFilePath%, General, Resolution
IniWrite, %ShowTooltip%, %ConfigFilePath%, General, ShowTooltip
IniWrite, %TooltipX%, %ConfigFilePath%, General, TooltipX
IniWrite, %TooltipY%, %ConfigFilePath%, General, TooltipY
IniWrite, %ScriptDelay%, %ConfigFilePath%, General, ScriptDelay
IniWrite, %MinimizeToTray%, %ConfigFilePath%, General, MinimizeToTray
IniWrite, %AutoStart%, %ConfigFilePath%, General, AutoStart

; 保存多维变量设置
IniWrite, %DimensionDifficulty%, %ConfigFilePath%, Dimension, Difficulty
IniWrite, %DimensionAutoSelect%, %ConfigFilePath%, Dimension, AutoSelectCharacter
IniWrite, %DimensionAutoBeacon%, %ConfigFilePath%, Dimension, AutoSelectBeacon
IniWrite, %DimensionRetry%, %ConfigFilePath%, Dimension, AutoRetry
IniWrite, %DimensionAutoExit%, %ConfigFilePath%, Dimension, AutoExit
IniWrite, %DimensionMaxRuns%, %ConfigFilePath%, Dimension, MaxRuns

; 更新热键 (Update hotkeys)
UpdateHotkeys()
}

; 导出配置到文件 (Export Configuration to File)
ExportConfig()
{
global
FileSelectFile, ExportPath, S16, settings_export.ini, 导出配置文件, INI Files (*.ini)
if (ExportPath != "")
{
FileCopy, %ConfigFilePath%, %ExportPath%, 1
MsgBox, 64, 导出成功, 配置已导出到:`n%ExportPath%
}
}

; 从文件导入配置 (Import Configuration from File)
ImportConfig()
{
global
FileSelectFile, ImportPath, 3, , 导入配置文件, INI Files (*.ini)
if (ImportPath != "" && FileExist(ImportPath))
{
FileCopy, %ImportPath%, %ConfigFilePath%, 1
MsgBox, 64, 导入成功, 配置已导入，请重启脚本以应用新配置
}
}

; 备份配置 (Backup Configuration)
BackupConfig()
{
global
FormatTime, TimeStamp, , yyyyMMdd_HHmmss
BackupPath := A_ScriptDir . "\settings_backup_" . TimeStamp . ".ini"
FileCopy, %ConfigFilePath%, %BackupPath%, 1
MsgBox, 64, 备份成功, 配置已备份到:`n%BackupPath%
}

; 恢复默认配置 (Restore Default Configuration)
RestoreDefaultConfig()
{
global
MsgBox, 36, 确认恢复, 确定要恢复所有设置为默认值吗？这将覆盖当前配置。
IfMsgBox Yes
{
FileDelete, %ConfigFilePath%
CreateDefaultConfig()
LoadConfig()
MsgBox, 64, 恢复成功, 所有设置已恢复为默认值，请重启脚本以应用新配置
}
}
