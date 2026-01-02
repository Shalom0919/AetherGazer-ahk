; ----------------------------------------------------------------------------
; 热键管理模块
; Hotkey Manager Module
; ----------------------------------------------------------------------------

; 初始化所有热键 (Initialize All Hotkeys)
; 在脚本启动时调用，注册所有角色和功能热键
; (Called at script startup to register all character and function hotkeys)
InitHotkeys()
{
    global
    
    ; 获取角色元数据 (Get character metadata)
    characters := GetCharacterMeta()
    
    ; 注册角色热键 (Register character hotkeys)
    For index, char in characters
    {
        keyVar := char.keyVar
        label := char.label
        hotkey := %keyVar%
        
        if (hotkey != "")
        {
            Try Hotkey, %hotkey%, %label%, On
        }
    }
    
    ; 注册功能热键 (Register function hotkeys)
    functions := GetFunctionKeyMeta()
    For index, func in functions
    {
        keyVar := func.keyVar
        label := func.label
        hotkey := %keyVar%
        
        if (hotkey != "")
        {
            Try Hotkey, %hotkey%, %label%, On
        }
    }
}

; 更新热键 (Update Hotkeys)
; 在设置保存后调用，重新注册所有热键
; (Called after settings are saved to re-register all hotkeys)
UpdateHotkeys()
{
    global
    
    ; 获取角色元数据 (Get character metadata)
    characters := GetCharacterMeta()
    
    ; 更新角色热键 (Update character hotkeys)
    For index, char in characters
    {
        keyVar := char.keyVar
        label := char.label
        hotkey := %keyVar%
        
        if (hotkey != "")
        {
            Try Hotkey, %hotkey%, %label%, On
        }
    }
    
    ; 更新功能热键 (Update function hotkeys)
    functions := GetFunctionKeyMeta()
    For index, func in functions
    {
        keyVar := func.keyVar
        label := func.label
        hotkey := %keyVar%
        
        if (hotkey != "")
        {
            Try Hotkey, %hotkey%, %label%, On
        }
    }
}

; 注册新角色热键 (Register New Character Hotkey)
; 用于动态添加新角色时注册热键
; (Used to register hotkeys when dynamically adding new characters)
; 参数 (Parameters):
;   keyVar - 热键变量名 (Hotkey variable name), 例如 "NewCharacterKey"
;   label - 热键标签名 (Hotkey label name), 例如 "NewCharacter"
RegisterCombatHotkey(keyVar, label)
{
    global
    hotkey := %keyVar%
    
    if (hotkey != "")
    {
        Try Hotkey, %hotkey%, %label%, On
    }
}

; 禁用热键 (Disable Hotkey)
; 临时禁用指定的热键
; (Temporarily disable specified hotkey)
DisableHotkey(keyVar)
{
    global
    hotkey := %keyVar%
    
    if (hotkey != "")
    {
        Try Hotkey, %hotkey%, Off
    }
}

; 启用热键 (Enable Hotkey)
; 重新启用之前禁用的热键
; (Re-enable previously disabled hotkey)
EnableHotkey(keyVar)
{
    global
    hotkey := %keyVar%
    
    if (hotkey != "")
    {
        Try Hotkey, %hotkey%, On
    }
}
