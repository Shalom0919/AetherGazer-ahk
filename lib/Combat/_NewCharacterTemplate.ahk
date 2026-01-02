; ----------------------------------------------------------------------------
; 新角色模板
; New Character Template
; 
; 此文件作为添加新角色的模板
; This file serves as a template for adding new characters
; 
; 使用步骤 (Usage Steps):
; 1. 复制此文件并重命名为新角色的文件名，例如 "Xingjian.ahk"
;    (Copy this file and rename to new character's filename, e.g. "Xingjian.ahk")
; 
; 2. 修改下面的战斗逻辑代码
;    (Modify the combat logic code below)
; 
; 3. 在 lib/Config/KeyMappings.ahk 的 GetDefaultKeyMappings() 中添加新角色的热键
;    (Add new character's hotkey in GetDefaultKeyMappings() in lib/Config/KeyMappings.ahk)
;    例如: mappings["XingjianKey"] := "Numpad8"
; 
; 4. 在 lib/Config/KeyMappings.ahk 的 GetCharacterMeta() 中添加角色元数据
;    (Add character metadata in GetCharacterMeta() in lib/Config/KeyMappings.ahk)
;    例如: characters.Push({id: 15, name: "星见", keyVar: "XingjianKey", label: "Xingjian"})
; 
; 5. 在 AetherGazerMain.ahk 的战斗脚本区域添加 #Include
;    (Add #Include in combat scripts section of AetherGazerMain.ahk)
;    例如: #Include lib\Combat\Xingjian.ahk
; 
; 6. （可选）在 lib/GUI/SettingsGUI.ahk 和 lib/GUI/FloatGUI.ahk 中添加 GUI 控件
;    (Optional: Add GUI controls in lib/GUI/SettingsGUI.ahk and lib/GUI/FloatGUI.ahk)
; ----------------------------------------------------------------------------

; ============================================================================
; 第1步：定义战斗标志ID和标签名
; Step 1: Define Combat Flag ID and Label Name
; ============================================================================

; 选择一个未使用的ID（查看 lib/Core/GlobalVars.ahk 中已使用的ID）
; Choose an unused ID (check used IDs in lib/Core/GlobalVars.ahk)
; 在本例中，我们假设使用 ID 15
; In this example, we assume using ID 15

global 15_Enable := false  ; 新角色的战斗标志 (Combat flag for new character)

; ============================================================================
; 第2步：定义热键标签
; Step 2: Define Hotkey Label
; ============================================================================

; 此标签名应该与 KeyMappings.ahk 中 GetCharacterMeta() 返回的 label 字段匹配
; This label name should match the label field returned by GetCharacterMeta() in KeyMappings.ahk
; 在本例中，我们使用 "NewCharacter" 作为示例
; In this example, we use "NewCharacter" as an example

#If WinActive("ahk_exe AetherGazer.exe") || WinActive("ahk_exe AetherGazer_Bili.exe")
NewCharacter:
{
	if IsGameActive()
	{
		; 切换战斗状态 (Toggle combat status)
		15_Enable := !15_Enable
		
		if (15_Enable = false)
		{
			; 停止战斗 (Stop combat)
			SetTimer, Press15, Off
			ClearStatus()
		}
		else
		{
			; 启动战斗 (Start combat)
			Sleep 100
			SetTimer, Press15, 10
			ShowStatus("新角色：启动")  ; 修改为实际角色名 (Change to actual character name)
		}
	}
}

; ============================================================================
; 第3步：定义战斗循环逻辑
; Step 3: Define Combat Loop Logic
; ============================================================================

Press15:
	; 检查游戏是否激活 (Check if game is active)
	if !IsGameActive()
	{
		SetTimer, Press15, Off
		ClearStatus()
		15_Enable := false
		return
	}
	
	; ============================================================
	; 在此处编写你的战斗逻辑
	; Write your combat logic here
	; ============================================================
	
	; 示例1：简单的技能循环 (Example 1: Simple skill rotation)
	; ------------------------------------------------------------
	; Send, {%Skill1Key%}
	; Sleep 10
	; Send, {%AttackKey%}
	; Sleep 10
	; Send, {%Skill2Key%}
	; Sleep 10
	; Send, {%Skill3Key%}
	; Sleep 10
	; Send, {%UltimateKey%}
	; Sleep 10
	; Send, {%Teammate1Key%}
	; Sleep 10
	; Send, {%Teammate2Key%}
	; Sleep 10
	
	; 示例2：使用 CombatBase.ahk 中的函数 (Example 2: Using functions from CombatBase.ahk)
	; ------------------------------------------------------------
	; combo := ["Skill1Key", "AttackKey", "Skill2Key", "Skill3Key", "UltimateKey"]
	; SendCombo(combo, 10)
	
	; 示例3：基于颜色检测的条件技能使用 (Example 3: Conditional skill use based on color detection)
	; ------------------------------------------------------------
	; if IsSkillReady(1161, 692, "0xFFFFFF")
	; {
	;     Send, {%Skill3Key%}
	;     Sleep 10
	; }
	; 
	; Send, {%Skill1Key%}
	; Sleep 10
	; Send, {%AttackKey%}
	; Sleep 10
	
	; 示例4：循环使用技能直到不可用 (Example 4: Loop skill use until unavailable)
	; ------------------------------------------------------------
	; LoopSkillUse(1161, 692, "Skill3Key", "0xFFFFFF", 10)
	; SendCombo(["Skill1Key", "AttackKey", "Skill2Key"], 10)
	
	; ============================================================
	; 重要提示 (Important Notes):
	; ============================================================
	; 1. 使用全局变量名（如 Skill1Key, AttackKey）而非硬编码按键
	;    (Use global variable names like Skill1Key, AttackKey instead of hardcoded keys)
	; 
	; 2. 在每个按键之后添加适当的 Sleep 延迟
	;    (Add appropriate Sleep delay after each key press)
	; 
	; 3. 对于需要颜色检测的角色，使用 GetColor(x, y) 和 IsSkillReady(x, y, color)
	;    (For characters requiring color detection, use GetColor(x, y) and IsSkillReady(x, y, color))
	; 
	; 4. 可以使用 CombatBase.ahk 中的通用函数来简化代码
	;    (You can use common functions from CombatBase.ahk to simplify code)
	; 
	; 5. 测试时注意游戏分辨率必须为 1280x720
	;    (When testing, note that game resolution must be 1280x720)
	; ============================================================
	
return

; ============================================================================
; 第4步（可选）：定义辅助函数
; Step 4 (Optional): Define Helper Functions
; ============================================================================

; 如果你的角色有复杂的逻辑，可以在这里定义辅助函数
; If your character has complex logic, you can define helper functions here
; 
; 例如 (Example):
; NewCharacter_SpecialCombo()
; {
;     global
;     
;     ; 特殊连招逻辑 (Special combo logic)
;     Send, {%Skill1Key%}
;     Sleep 200
;     Send, {%AttackKey%}
;     Sleep 200
;     Send, {%Skill2Key%}
; }

; ============================================================================
; 完成！
; Done!
; ============================================================================
; 
; 现在你可以：
; Now you can:
; 1. 在游戏中测试新角色的脚本
;    (Test the new character script in-game)
; 
; 2. 根据实际效果调整技能顺序和延迟时间
;    (Adjust skill order and delay times based on actual performance)
; 
; 3. 使用 Window Spy (AHK 自带工具) 获取技能图标的坐标和颜色
;    (Use Window Spy (AHK built-in tool) to get skill icon coordinates and colors)
; 
; 4. 分享你的脚本给其他玩家！
;    (Share your script with other players!)
; ============================================================================
