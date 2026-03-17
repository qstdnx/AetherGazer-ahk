; ----------------------------------------------------------------------------
; Script Name: 深空之眼
; Version: 3.2
; Author: qstdnx
; Contact: https://github.com/qstdnx/AetherGazer-ahk/issues
; ----------------------------------------------------------------------------
#Persistent             ;~让脚本持久运行
#SingleInstance,Force   ;~运行替换旧实例
ListLines,Off           ;~不显示最近执行的脚本行
SetBatchLines,-1        ;~脚本全速执行(默认10ms)
CoordMode,Menu,Window   ;~坐标相对活动窗口
;------------------------------------------------获取管理员权限 ↓↓↓
if !A_IsAdmin  ; 如果不是管理员权限
{
	try  ; 尝试以管理员身份重新启动脚本
	{
		if A_IsCompiled  ; 如果是编译后的 .exe
			Run *RunAs "%A_ScriptFullPath%" %1% %2% %3% %4% %5% %6% %7% %8% %9%
		else  ; 如果是 .ahk 脚本
			Run *RunAs "%A_AhkPath%" "%A_ScriptFullPath%" %1% %2% %3% %4% %5% %6% %7% %8% %9%
		ExitApp  ; 退出当前非管理员实例
	}
	catch  ; 如果用户拒绝了 UAC 弹窗
	{
		MsgBox "管理员权限请求被拒绝，3.5版本后深空之眼需要使用管理员权限运行脚本"
		ExitApp
	}
}

;------------------------------------------------设置 ↓↓↓
; 初始化快捷键
global UPKey := "w"
global DOWNKey := "s"
global LEFTKey := "a"
global RIGHTKey := "d"
global AttackKey := "j"
global Skill1Key := "u"
global Skill2Key := "i"
global Skill3Key := "o"
global DodgeKey := "Space"
global UltimateKey := "r"
global Teammate1Key := "1"
global Teammate2Key := "2"
global JinwuKey := "Numpad1"
global ShikoudiKey := "Numpad2"
global LingguangKey := "Numpad3"
global TuoteKey := "Numpad4"
; global HelusiKey:= "Numpad5"
global WeierKey := "Numpad6"
; global KaorouKey := "Numpad7"
global LiandianKey := "Numpad9"
global StopscriptKey := "Numpad0"
global ScriptDir := A_ScriptDir
IniFilePath := ScriptDir . "\settings.ini"

; 定义所有需要检查的键值对
KeyMappings := { "UpKey": UPKey
  , "DownKey": DOWNKey
	, "LeftKey": LEFTKey
	, "RightKey": RIGHTKey
  , "AttackKey": AttackKey
	, "Skill1Key": Skill1Key
	, "Skill2Key": Skill2Key
	, "Skill3Key": Skill3Key
	, "DodgeKey": DodgeKey
	, "UltimateKey": UltimateKey
	, "Teammate1Key": Teammate1Key
	, "Teammate2Key": Teammate2Key
	, "JinwuKey": JinwuKey
	, "ShikoudiKey": ShikoudiKey
	, "LingguangKey": LingguangKey
	, "TuoteKey": TuoteKey
	; , "HelusiKey": HelusiKey
	, "WeierKey": WeierKey
	; , "KaorouKey": KaorouKey
	, "LiandianKey": LiandianKey
	, "StopscriptKey": StopscriptKey }

; 检查INI文件是否存在，不存在则创建
if !FileExist(IniFilePath) {
	; 创建新的INI文件并写入所有默认值
	for key, value in KeyMappings {
		IniWrite, %value%, %IniFilePath%, Hotkeys, %key%
}
} else {
	; 检查INI文件中是否有缺失的键，有则补充
	for key, defaultValue in KeyMappings {
		IniRead, ReadValue, %IniFilePath%, Hotkeys, %key%
	if (ReadValue = "ERROR") {
		IniWrite, %defaultValue%, %IniFilePath%, Hotkeys, %key%
		ReadValue := defaultValue
	}
	; 更新全局变量
	%key% := ReadValue
}
}

; 设置热键
Hotkey, %JinwuKey%, Jinwu
Hotkey, %ShikoudiKey%, Shikoudi
Hotkey, %LingguangKey%, Lingguang
Hotkey, %TuoteKey%, Tuote
; Hotkey, %HelusiKey%, Helusi
Hotkey, %WeierKey%, Weier
; Hotkey, %KaorouKey%, Kaorou
Hotkey, %LiandianKey%, Liandian
Hotkey, %StopscriptKey%, Stopscript

Menu, Tray, NoStandard
Menu, Tray, Add, 快捷键设置, ShowSettingsGui
Menu, Tray, Add, 退出程序, ExitScript
ShowSettingsGUI() {
	global
	Gui, New
  Gui, Add, Tab3,,按键设置|自动操作
  GUI, Tab, 按键设置
  Gui, Add, Text,, 设置与你游戏内按键对应
  Gui, Add, Text,, 移动（前）
  Gui, Add, Hotkey, vUpKey, %UpKey%
  Gui, Add, Text,, 移动（后）
  Gui, Add, Hotkey, vDownKey, %DownKey%
  Gui, Add, Text,, 移动（左）
  Gui, Add, Hotkey, vLeftKey, %LeftKey%
  Gui, Add, Text,, 移动（右）
  Gui, Add, Hotkey, vRightKey, %RightKey%
	Gui, Add, Text,, 普攻
	Gui, Add, Hotkey, vAttackKey, %AttackKey%
	Gui, Add, Text,, 1 技能
	Gui, Add, Hotkey, vSkill1Key, %Skill1Key%
	Gui, Add, Text,, 2 技能
	Gui, Add, Hotkey, vSkill2Key, %Skill2Key%
	Gui, Add, Text,, 3 技能
	Gui, Add, Hotkey, vSkill3Key, %Skill3Key%
	Gui, Add, Text,, 闪避
	Gui, Add, Hotkey, vDodgeKey, %DodgeKey%
	Gui, Add, Text,, 奥义
	Gui, Add, Hotkey, vUltimateKey, %UltimateKey%
	Gui, Add, Text,, 队友1 奥义
	Gui, Add, Hotkey, vTeammate1Key, %Teammate1Key%
	Gui, Add, Text,, 队友2 奥义
	Gui, Add, Hotkey, vTeammate2Key, %Teammate2Key%
    Gui, tab, 自动操作
	Gui, Add, Text,, 金乌
	Gui, Add, Hotkey, vJinwuKey, %JinwuKey%
	Gui, Add, Text,, 诗寇蒂
	Gui, Add, Hotkey, vShikoudiKey, %ShikoudiKey%
	Gui, Add, Text,, 陵光
	Gui, Add, Hotkey, vLingguangKey, %LingguangKey%
	Gui, Add, Text,, 托特/哈迪斯/雷前鬼/水姆
	Gui, Add, Hotkey, vTuoteKey, %TuoteKey%
	; Gui, Add, Text,, 荷鲁斯
	; Gui, Add, Hotkey, vHelusiKey, %HelusiKey%
	Gui, Add, Text,, 薇儿/光赫拉/瓦吉特/执明`n赛尔凯特/伊里伽尔/霍德尔`n娜美/梵天/荷鲁斯
	Gui, Add, Hotkey, vWeierKey, %WeierKey%
	; Gui, Add, Text,, 自动烤肉
	; Gui, Add, Hotkey, vKaorouKey, %KaorouKey%
	Gui, Add, Text,, 简易连点器
	Gui, Add, Hotkey, vLiandianKey, %LiandianKey%
	Gui, Add, Text,, 停止脚本
	Gui, Add, Hotkey, vStopscriptKey, %StopscriptKey%
    Gui, Tab
	Gui, Add, Button, default, OK
	Gui, Show, , 设置快捷键
	return
}

GuiClose:
GuiEscape:
	Gui, Destroy
return

ButtonOK:
	Gui, Submit
	FileDelete, %IniFilePath%
	for key, value in KeyMappings {
		IniWrite, % %key%, %IniFilePath%, Hotkeys, %key%
	}

	; 更新全局变量
	for key in KeyMappings {
		%key% := %key%
	}

	; 重新设置热键
	Hotkey, %JinwuKey%, Jinwu
	Hotkey, %ShikoudiKey%, Shikoudi
	Hotkey, %LingguangKey%, Lingguang
	Hotkey, %TuoteKey%, Tuote
	; Hotkey, %HelusiKey%, Helusi
	Hotkey, %WeierKey%, Weier
	; Hotkey, %KaorouKey%, Kaorou
	Hotkey, %LiandianKey%, Liandian
    Hotkey, %StopscriptKey%, Stopscript

return

;------------------------------------------------深空之眼下才有效果 ↓↓↓
#If WinActive("ahk_exe AetherGazer.exe") || WinActive("ahk_exe AetherGazer_Bili.exe")
SysGet, VirtualWidth, 16
SysGet, VirtualHeight, 17
CoordMode, ToolTip, Screen
;-------------------------------------------------定义变量 ↓↓↓
GetColor(x,y)
{
	PixelGetColor, color, x, y,  RGB
	StringRight color,color,10 ;
	return color
}
;这个游戏指针会干扰window spy取色，建议换截图工具取色。
;------------------------------------------------金乌飞天,小键盘1启动 ↓↓↓

1_Enable= false
#If WinActive("ahk_exe AetherGazer.exe") || WinActive("ahk_exe AetherGazer_Bili.exe")
Jinwu:
	{
		if WinActive("ahk_exe AetherGazer.exe") or WinActive("ahk_exe AetherGazer_Bili.exe")
		{
			1_Enable :=!1_Enable
			if (1_Enable=false)
			{
				SetTimer, Press1, Off
				ToolTip
			}
			else
			{
				Sleep 100
				SetTimer, Press1, 10  ;
				ToolTip, 金乌：启动, 200, 0
			}
		}
	}

Press1:
	if WinActive("ahk_exe AetherGazer.exe") or WinActive("ahk_exe AetherGazer_Bili.exe")
	{
		Send, {%Skill1Key%}
		Sleep 10
		Send, {%Skill1Key%}
		Sleep 10
		Send, {%AttackKey%}
		Sleep 10
		Send, {%Skill2Key%}
		Sleep 10
		Send, {%UltimateKey%}
		Sleep 10
		Send, {%AttackKey%}
		Sleep 10
		Send, {%Teammate1Key%}
		Sleep 10
		Send, {%AttackKey%}
		Sleep 10
		Send, {%Teammate2Key%}
		Sleep 10
		Send, {%AttackKey%}
		Sleep 10
		Send, {%Skill1Key%}
		Sleep 10
		Send, {%AttackKey%}
		Sleep 10
		Send, {%Skill2Key%}
		Sleep 10
		Send, {%UltimateKey%}
		Sleep 10
		Send, {%AttackKey%}
		Sleep 10
		Send, {%Teammate1Key%}
		Sleep 10
		Send, {%AttackKey%}
		Sleep 10
		Send, {%Teammate2Key%}
		Sleep 10
		Send, {%AttackKey%}
		Sleep 10
		Send, {%Skill1Key%}
		Sleep 10
		Send, {%Skill1Key%}
		Sleep 10
		Send, {%AttackKey%}
		Sleep 10
		Send, {%Skill2Key%}
		Sleep 10
		Send, {%UltimateKey%}
		Sleep 10
		Send, {%AttackKey%}
		Sleep 10
		Send, {%Teammate1Key%}
		Sleep 10
		Send, {%AttackKey%}
		Sleep 10
		Send, {%Teammate2Key%}
		Sleep 10
		Send, {%AttackKey%}
		Sleep 10
		Send, {%Skill1Key%}
		Sleep 10
		Send, {%Skill1Key%}
		Sleep 10
		Send, {%AttackKey%}
		Sleep 10
		Send, {%Skill2Key%}
		Sleep 10
		Send, {%UltimateKey%}
		Sleep 10
		Send, {%AttackKey%}
		Sleep 10
		Send, {%Teammate1Key%}
		Sleep 10
		Send, {%AttackKey%}
		Sleep 10
		Send, {%Teammate2Key%}
		Sleep 10
		Send, {%AttackKey%}
		Sleep 10
        Send, {%Skill3Key%}

	}
	else
	{
		SetTimer, Press1, Off
		ToolTip
		1_Enable= false
	}
return
;------------------------------------------------诗寇蒂自动战斗,小键盘2启动 ↓↓↓
2_Enable= false
#If WinActive("ahk_exe AetherGazer.exe") || WinActive("ahk_exe AetherGazer_Bili.exe")
Shikoudi:
	{
		if WinActive("ahk_exe AetherGazer.exe") or WinActive("ahk_exe AetherGazer_Bili.exe")
		{
			2_Enable :=!2_Enable
			if (2_Enable=false)
			{
				SetTimer, Press2, Off
				ToolTip
			}
			else
			{
				Sleep 100
				SetTimer, Press2, 10
				ToolTip, 诗寇蒂：启动, 200, 0
			}
		}
	}

Press2:
	if WinActive("ahk_exe AetherGazer.exe") or WinActive("ahk_exe AetherGazer_Bili.exe")
	{
		Send, {%Skill2Key%}
		Sleep 10
		Send, {%AttackKey%}
		Sleep 10
		Send, {%Skill3Key%}
		Sleep 10
		Send, {%UltimateKey%}
		Sleep 10
		Send, {%Teammate1Key%}
		Sleep 10
		Send, {%AttackKey%}
        Sleep 10
        Send, {%Teammate2Key%}
	}
	else
	{
		SetTimer, Press2, Off
		ToolTip
		2_Enable= false
	}
return

;------------------------------------------------陵光自动操作，小键盘3启动 ↓↓↓
3_Enable= false
#If WinActive("ahk_exe AetherGazer.exe") || WinActive("ahk_exe AetherGazer_Bili.exe")
Lingguang:
	{
		if WinActive("ahk_exe AetherGazer.exe") or WinActive("ahk_exe AetherGazer_Bili.exe")
		{
			3_Enable :=!3_Enable
			if (3_Enable=false)
			{
				SetTimer, Press3, Off
				ToolTip
			}
			else
			{
				Sleep 100
				SetTimer, Press3, 10  ;
				ToolTip, 陵光：启动, 200, 0
			}
		}
	}

Press3:
	if WinActive("ahk_exe AetherGazer.exe") or WinActive("ahk_exe AetherGazer_Bili.exe")
	{
		Send, {%AttackKey%}
		Sleep 250
		Send, {%Skill1Key%}
		Sleep 250
		Send, {%UltimateKey%}
		Send, {%Teammate1Key%}
		Send, {%Teammate2Key%}
	}
	else
	{
		SetTimer, Press3, Off
		ToolTip
		1_Enable= false
	}
return

;------------------------------------------------托特/哈迪斯/雷前鬼/水姆自动战斗,小键盘4启动 ↓↓↓

4_Enable= false
#If WinActive("ahk_exe AetherGazer.exe") || WinActive("ahk_exe AetherGazer_Bili.exe")
Tuote:
	{
		if WinActive("ahk_exe AetherGazer.exe") or WinActive("ahk_exe AetherGazer_Bili.exe")
		{
			4_Enable :=!4_Enable
			if (4_Enable=false)
			{
				SetTimer, Press4, Off
				ToolTip
			}
			else
			{
				Sleep 100
				SetTimer, Press4, 10  ;
				ToolTip, 托特/哈迪斯/雷前鬼/水姆：启动, 200, 0
			}
		}
	}

Press4:
	if WinActive("ahk_exe AetherGazer.exe") or WinActive("ahk_exe AetherGazer_Bili.exe")
	{
		Send, {%AttackKey% Down}
		Sleep, 500
		Send, {%AttackKey% Up}
		Send, {%Skill3Key%}
		Sleep 10
		Send, {%Skill3Key%}
		Sleep 10
		Send, {%AttackKey%}
		Sleep 10
		Send, {%Skill1Key%}
		Sleep 10
		Send, {%Skill1Key%}
		Sleep 10
		Send, {%AttackKey%}
		Sleep 10
		Send, {%Skill2Key%}
		Sleep 10
		Send, {%UltimateKey%}
		Sleep 10
		Send, {%AttackKey%}
		Sleep 10
		Send, {%Teammate1Key%}
		Sleep 10
		Send, {%Teammate2Key%}
		Sleep 10
	}
	else
	{
		SetTimer, Press4, Off
		ToolTip
		4_Enable= false
	}
return

;------------------------------------------------薇儿/光赫拉/瓦吉特/执明/赛尔凯特/伊里伽尔/霍德尔/娜美/梵天/荷鲁斯自动战斗,小键盘6启动 ↓↓↓
6_Enable= false
#If WinActive("ahk_exe AetherGazer.exe") || WinActive("ahk_exe AetherGazer_Bili.exe")
Weier:
	{
		if WinActive("ahk_exe AetherGazer.exe") or WinActive("ahk_exe AetherGazer_Bili.exe")
		{
			6_Enable :=!6_Enable
			if (6_Enable=false)
			{
				SetTimer, Press6, Off
				ToolTip
			}
			else
			{
				Sleep 100
				SetTimer, Press6, 10  ;
				ToolTip, 薇儿/光赫拉/瓦吉特/执明/赛尔凯特/伊里伽尔/霍德尔/娜美/梵天/荷鲁斯：启动, 200, 0
			}
		}
	}

Press6:
	if WinActive("ahk_exe AetherGazer.exe") or WinActive("ahk_exe AetherGazer_Bili.exe")
	{
		Send, {%Skill3Key%}
		Sleep 5
		Send, {%AttackKey%}
		Sleep 5
		Send, {%Skill1Key%}
		Sleep 5
		Send, {%UltimateKey%}
		Sleep 5
		Send, {%AttackKey%}
		Sleep 5
		Send, {%Skill2Key%}
		Sleep 5
		Send, {%Teammate1Key%}
		Sleep 5
		Send, {%Skill1Key%}
		Sleep 5
		Send, {%Teammate2Key%}
		Sleep 5
		Send, {%Skill2Key%}
		Sleep 5
	}
	else
	{
		SetTimer, Press6, Off
		ToolTip
		6_Enable= false
	}
return

;--------------------------简易连点器功能，右ctrl+任意键连点，小键盘9启动自定义连点↓↓↓
9_Enable := false
Inputkey := ""
RControl::
	Input, Inputkey, L1 I V, {MouseX, MouseY}
	9_Enable := true
	loop {
		if WinActive("ahk_exe AetherGazer.exe") or WinActive("ahk_exe AetherGazer_Bili.exe"){
			if (9_Enable){
				Send, %Inputkey%
				Sleep, 50
				ToolTip, %Inputkey% 键连点中，按%StopscriptKey%停止
			}
			if (!9_Enable or Inputkey=""){
				ToolTip
				break
			}
		} else {
			9_Enable := false
			ToolTip
			break
		}
	}
return

;可记忆版本，容易卡键
; keyToClick := ""
; RControl::
;     Input, Inputkey, L1 I V, {MouseX, MouseY}
;     keyToClick := keyToClick . Inputkey
;     9_Enable := true
;     Loop {
;         If WinActive("ahk_exe AetherGazer.exe") or WinActive("ahk_exe AetherGazer_Bili.exe"){
;         if (9_Enable){
;             Send, %keyToClick%
;             Sleep, 50
;             Tooltip, %keyToClick% 键连点中，按%StopscriptKey%停止`n按右alt键暂停，再次点击右ctrl+任意键同时连点暂停前记录的按键
;             }
;             if (!9_Enable or keyToClick=""){
;             Tooltip
;             break
;             }
;         } else {
;         9_Enable := false
;         Tooltip
;         break
;         }
;     }
;     return

;连点鼠标，导致rctrl失效
; RControl & LButton::
;     Loop {
;     If WinActive("ahk_exe AetherGazer.exe") or WinActive("ahk_exe AetherGazer_Bili.exe"){
;         if (9_Enable)
;         Click
;         Sleep, 50
;         ToolTip,鼠标左键连点中，`n间隔50毫秒，按%StopscriptKey%停止
;         } else {
;         9_Enable := false
;         ToolTip
;         break
;         }
;     }
;     return

; RAlt::
;     9_Enable := false
;     return

Liandian:
	{
		if WinActive("ahk_exe AetherGazer.exe") or WinActive("ahk_exe AetherGazer_Bili.exe")
			gosub, 连点弹框输入
		return
	}
连点弹框输入:
	Gui, MouseClickGui: New
	Gui, MouseClickGui: +AlwaysOnTop
	Gui, MouseClickGui: Add, Text, , 填写连点的按键：`n同时连按多个按键直接填入即可，例如填入jkio为同时连点jkio四个按键`n特殊按键用{}圈住，例如鼠标左键为{LButton}，空格键为{Space}，左Shift为{LShift}
	Gui, MouseClickGui: Add, Edit, w400 v连点按键, {LButton}
	Gui, MouseClickGui: Add, Text, , 连点间隔（单位毫秒）：
	Gui, MouseClickGui: Add, Edit, w400 v连点间隔, 50
	Gui, MouseClickGui: Add, Button, default g连点确认, 确认
	Gui, MouseClickGui: Show, , 按键连点
return
连点确认:
	Gui, MouseClickGui: Submit
	global WhichButton:= 连点按键
	global interval:= 连点间隔
	SetTimer, ContinuousClick, %连点间隔%
return

ContinuousClick:
	if WinActive("ahk_exe AetherGazer.exe") or WinActive("ahk_exe AetherGazer_Bili.exe")
		Send, %WhichButton%
	ToolTip,%WhichButton%键连点中，`n间隔%interval%毫秒，按%StopscriptKey%停止
return



;------------------------------------------------强制停止脚本，小键盘0↓↓↓
Stopscript:
	Reload
	1_Enable= False
	2_Enable= False
	3_Enable= False
	4_Enable= False
	5_Enable= False
	6_Enable= False
	7_Enable= False
	9_Enable= False
return
;------------------------------------------------退出脚本↓↓↓
ExitScript:
    ExitApp
return
