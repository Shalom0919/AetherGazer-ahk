; ----------------------------------------------------------------------------
; 战斗基类模块
; Combat Base Module
; 提供通用的战斗脚本函数 (Provides common combat script functions)
; ----------------------------------------------------------------------------

; 通用切换战斗脚本函数 (Generic Toggle Combat Script Function)
; 用于启动/停止角色战斗脚本
; (Used to start/stop character combat scripts)
; 参数 (Parameters):
;   combatId - 战斗标志ID (Combat flag ID), 例如 1 表示金乌
;   timerLabel - 定时器标签名 (Timer label name), 例如 "Press1"
;   characterName - 角色名称（用于提示）(Character name for tooltip)
;   timerInterval - 定时器间隔（毫秒，默认10ms）(Timer interval in ms, default 10ms)
ToggleCombatScript(combatId, timerLabel, characterName, timerInterval := 10)
{
	global
	
	if !IsGameActive()
		return
	
	; 切换状态 (Toggle status)
	%combatId%_Enable := !%combatId%_Enable
	
	if (%combatId%_Enable = false)
	{
		SetTimer, %timerLabel%, Off
		ClearStatus()
	}
	else
	{
		Sleep 100
		SetTimer, %timerLabel%, %timerInterval%
		ShowStatus(characterName . "：启动")
	}
}

; 检查并停止战斗 (Check and Stop Combat)
; 当游戏窗口失去焦点时自动停止战斗脚本
; (Automatically stops combat script when game window loses focus)
; 参数 (Parameters):
;   combatId - 战斗标志ID (Combat flag ID)
;   timerLabel - 定时器标签名 (Timer label name)
CheckAndStopCombat(combatId, timerLabel)
{
	global
	
	if !IsGameActive()
	{
		SetTimer, %timerLabel%, Off
		ClearStatus()
		%combatId%_Enable := false
		return true
	}
	return false
}

; 发送连招 (Send Combo)
; 按顺序发送一组技能按键
; (Sends a sequence of skill keys)
; 参数 (Parameters):
;   combo - 按键数组 (Array of keys), 例如 ["Skill1Key", "AttackKey", "Skill2Key"]
;   delay - 每个按键之间的延迟（毫秒，默认10ms）(Delay between keys in ms, default 10ms)
SendCombo(combo, delay := 10)
{
	global
	
	for index, keyVar in combo
	{
		key := %keyVar%
		Send, {%key%}
		Sleep, %delay%
	}
}

; 条件连招 (Conditional Combo)
; 根据技能是否就绪来决定发送哪些按键
; (Decides which keys to send based on skill availability)
; 参数 (Parameters):
;   skillChecks - 技能检查数组 (Skill check array)
;     每个元素格式: {x: x坐标, y: y坐标, color: 就绪颜色, key: 按键变量名}
;     (Each element format: {x: x coord, y: y coord, color: ready color, key: key variable name})
;   delay - 延迟（毫秒）(Delay in ms)
SendConditionalCombo(skillChecks, delay := 10)
{
	global
	
	for index, check in skillChecks
	{
		if IsSkillReady(check.x, check.y, check.color)
		{
			key := check.key
			actualKey := %key%
			Send, {%actualKey%}
			Sleep, %delay%
		}
	}
}

; 循环技能检查 (Loop Skill Check)
; 持续检查并使用某个技能直到不可用
; (Continuously checks and uses a skill until unavailable)
; 参数 (Parameters):
;   x, y - 技能图标位置 (Skill icon position)
;   keyVar - 按键变量名 (Key variable name)
;   checkColor - 就绪颜色（默认白色）(Ready color, default white)
;   delay - 延迟（毫秒）(Delay in ms)
;   maxLoop - 最大循环次数（防止卡死，默认100）(Max loop count to prevent hanging, default 100)
LoopSkillUse(x, y, keyVar, checkColor := "0xFFFFFF", delay := 10, maxLoop := 100)
{
	global
	key := %keyVar%
	loopCount := 0
	
	Loop
	{
		if (GetColor(x, y) == checkColor && loopCount < maxLoop)
		{
			Send, {%key%}
			Sleep, %delay%
			loopCount++
		}
		else
		{
			break
		}
	}
}

; 基础战斗循环 (Basic Combat Loop)
; 标准的战斗脚本循环模板
; (Standard combat script loop template)
; 参数 (Parameters):
;   combatId - 战斗标志ID (Combat flag ID)
;   combatFunc - 战斗逻辑函数名 (Combat logic function name)
BasicCombatLoop(combatId, combatFunc)
{
	global
	
	Loop
	{
		; 检查是否需要停止 (Check if should stop)
		if (!%combatId%_Enable || !IsGameActive())
		{
			ClearStatus()
			break
		}
		
		; 执行战斗逻辑 (Execute combat logic)
		%combatFunc%()
		
		Sleep, 10
	}
}

; 智能技能使用 (Smart Skill Use)
; 根据优先级使用技能
; (Uses skills based on priority)
; 参数 (Parameters):
;   skillPriority - 技能优先级数组 (Skill priority array)
;     每个元素格式: {x: x坐标, y: y坐标, color: 就绪颜色, key: 按键变量名, priority: 优先级}
;     (Each element format: {x: x coord, y: y coord, color: ready color, key: key variable name, priority: priority value})
;   delay - 延迟（毫秒）(Delay in ms)
SmartSkillUse(skillPriority, delay := 10)
{
	global
	
	; 按优先级排序 (Sort by priority)
	sortedSkills := []
	for index, skill in skillPriority
	{
		sortedSkills.Push(skill)
	}
	
	; 简单冒泡排序（因为技能数量通常很少）(Simple bubble sort, as skill count is usually small)
	Loop % sortedSkills.Length()
	{
		i := A_Index
		Loop % sortedSkills.Length() - i
		{
			j := A_Index
			if (sortedSkills[j].priority < sortedSkills[j+1].priority)
			{
				temp := sortedSkills[j]
				sortedSkills[j] := sortedSkills[j+1]
				sortedSkills[j+1] := temp
			}
		}
	}
	
	; 使用第一个可用的高优先级技能 (Use first available high priority skill)
	for index, skill in sortedSkills
	{
		if IsSkillReady(skill.x, skill.y, skill.color)
		{
			key := skill.key
			actualKey := %key%
			Send, {%actualKey%}
			Sleep, %delay%
			return true
		}
	}
	
	return false
}
