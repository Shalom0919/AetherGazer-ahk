; ----------------------------------------------------------------------------
; 按键映射定义模块
; Key Mappings Definition Module
; ----------------------------------------------------------------------------

; 获取默认按键映射 (Get Default Key Mappings)
; 返回包含所有默认按键配置的对象 (Returns an object containing all default key configurations)
GetDefaultKeyMappings()
{
    mappings := {}
    
    ; 游戏内按键 (In-Game Keys)
    mappings["UpKey"] := "w"
    mappings["DownKey"] := "s"
    mappings["LeftKey"] := "a"
    mappings["RightKey"] := "d"
    mappings["AttackKey"] := "j"
    mappings["Skill1Key"] := "u"
    mappings["Skill2Key"] := "i"
    mappings["Skill3Key"] := "o"
    mappings["DodgeKey"] := "Space"
    mappings["UltimateKey"] := "r"
    mappings["Teammate1Key"] := "1"
    mappings["Teammate2Key"] := "2"
    
    ; 角色脚本热键 (Character Script Hotkeys)
    mappings["JinwuKey"] := "Numpad1"
    mappings["DimensionKey"] := "Numpad2"
    mappings["LingguangKey"] := "Numpad3"
    mappings["TuoteKey"] := "Numpad4"
    mappings["NameiKey"] := "Numpad5"
    mappings["WeierKey"] := "Numpad6"
    mappings["KaorouKey"] := "Numpad7"
    mappings["LiandianKey"] := "Numpad9"
    mappings["FantianKey"] := "^Numpad1"
    mappings["ShikoudiKey"] := "^Numpad2"
    mappings["FengqianfangtiangouKey"] := "^Numpad3"
    mappings["YalishaKey"] := "^Numpad4"
    mappings["StopscriptKey"] := "Numpad0"
    
    return mappings
}

; 获取角色元数据 (Get Character Metadata)
; 返回角色ID、名称、热键变量名的映射，便于动态添加新角色
; (Returns mapping of character ID, name, and hotkey variable name for dynamic character addition)
GetCharacterMeta()
{
    characters := []
    
    ; 格式: {id: 战斗标志ID, name: 显示名称, keyVar: 热键变量名, label: 热键标签}
    ; Format: {id: Combat flag ID, name: Display name, keyVar: Hotkey variable name, label: Hotkey label}
    
    characters.Push({id: 1, name: "金乌", keyVar: "JinwuKey", label: "Jinwu"})
    characters.Push({id: 2, name: "多维变量", keyVar: "DimensionKey", label: "Dimension"})
    characters.Push({id: 3, name: "陵光", keyVar: "LingguangKey", label: "Lingguang"})
    characters.Push({id: 4, name: "托特/哈迪斯/雷前鬼/水姆", keyVar: "TuoteKey", label: "Tuote"})
    characters.Push({id: 5, name: "娜美", keyVar: "NameiKey", label: "Namei"})
    characters.Push({id: 6, name: "薇儿/光赫拉/瓦吉特/执明", keyVar: "WeierKey", label: "Weier"})
    characters.Push({id: 7, name: "烤肉", keyVar: "KaorouKey", label: "Kaorou"})
    characters.Push({id: 9, name: "连点器", keyVar: "LiandianKey", label: "Liandian"})
    characters.Push({id: 11, name: "梵天", keyVar: "FantianKey", label: "Fantian"})
    characters.Push({id: 12, name: "诗寇蒂", keyVar: "ShikoudiKey", label: "Shikoudi"})
    characters.Push({id: 13, name: "樱切（左线）", keyVar: "FengqianfangtiangouKey", label: "Fengqianfangtiangou"})
    characters.Push({id: 14, name: "亚莉莎（左线）", keyVar: "YalishaKey", label: "Yalisha"})
    
    return characters
}

; 获取功能键元数据 (Get Function Key Metadata)
; 返回特殊功能键的映射 (Returns mapping of special function keys)
GetFunctionKeyMeta()
{
    functions := []
    
    functions.Push({keyVar: "StopscriptKey", label: "Stopscript", name: "停止脚本"})
    
    return functions
}
