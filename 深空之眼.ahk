; ----------------------------------------------------------------------------
; Script Name: 深空之眼
; Version: 1.0
; Author: qstdnx
; Contact: 358844541@qq.com
; ----------------------------------------------------------------------------
#Persistent             ;~让脚本持久运行
#SingleInstance,Force   ;~运行替换旧实例
ListLines,Off           ;~不显示最近执行的脚本行
SetBatchLines,-1        ;~脚本全速执行(默认10ms)
CoordMode,menu,Window   ;~坐标相对活动窗口
;------------------------------------------------设置 ↓↓↓
; 初始化快捷键
global Skill1Key := "u"
global Skill2Key := "i"
global Skill3Key := "o"
global UltimateKey := "r"
global Teammate1Key := "1"
global Teammate2Key := "2"
global AttackKey := "j"

ScriptDir := A_ScriptDir
IniFilePath := ScriptDir . "\settings.ini"

        if FileExist(IniFilePath) {
        IniRead, Skill1Key, %IniFilePath%, Hotkeys, Skill1Key 
        IniRead, Skill2Key, %IniFilePath%, Hotkeys, Skill2Key
        IniRead, Skill3Key, %IniFilePath%, Hotkeys, Skill3Key
        IniRead, AttackKey, %IniFilePath%, Hotkeys, AttackKey
        IniRead, UltimateKey, %IniFilePath%, Hotkeys, UltimateKey
        IniRead, Teammate1Key, %IniFilePath%, Hotkeys, Teammate1Key
        IniRead, Teammate2Key, %IniFilePath%, Hotkeys, Teammate2Key
    }
Menu, Tray, Add, 快捷键设置, ShowSettingsGUI
ShowSettingsGUI() {
    Gui, New
    Gui, Add, Text,, 1 技能快捷键:
    Gui, Add, Hotkey, vSkill1Key, % Skill1Key
    Gui, Add, Text,, 2 技能快捷键:
    Gui, Add, Hotkey, vSkill2Key, % Skill2Key
    Gui, Add, Text,, 3 技能快捷键:
    Gui, Add, Hotkey, vSkill3Key, % Skill3Key
    Gui, Add, Text,, 普攻快捷键:
    Gui, Add, Hotkey, vAttackKey, % AttackKey
    Gui, Add, Text,, 奥义快捷键:
    Gui, Add, Hotkey, vUltimateKey, % UltimateKey
    Gui, Add, Text,, 队友1 奥义快捷键:
    Gui, Add, Hotkey, vTeammate1Key, % Teammate1Key
    Gui, Add, Text,, 队友2 奥义快捷键:
    Gui, Add, Hotkey, vTeammate2Key, % Teammate2Key
    Gui, Add, Button, default, OK
    Gui, Show, , 设置快捷键
    }
    return

    GuiClose:
    GuiEscape:
    Gui, Destroy
    return

    ButtonOK:
    Gui, Submit
    FileDelete, %IniFilePath%
    IniWrite, %Skill1Key%, %IniFilePath%, Hotkeys, Skill1Key
    IniWrite, %Skill2Key%, %IniFilePath%, Hotkeys, Skill2Key
    IniWrite, %Skill3Key%, %IniFilePath%, Hotkeys, Skill3Key
    IniWrite, %AttackKey%, %IniFilePath%, Hotkeys, AttackKey
    IniWrite, %UltimateKey%, %IniFilePath%, Hotkeys, UltimateKey
    IniWrite, %Teammate1Key%, %IniFilePath%, Hotkeys, Teammate1Key
    IniWrite, %Teammate2Key%, %IniFilePath%, Hotkeys, Teammate2Key
    ; 更新全局变量
    Skill1Key := Skill1Key
    Skill2Key := Skill2Key
    Skill3Key := Skill3Key
    AttackKey := AttackKey
    UltimateKey := UltimateKey
    Teammate1Key := Teammate1Key
    Teammate2Key := Teammate2Key

Return
;------------------------------------------------深空之眼下才有效果 ↓↓↓
#IfWinActive ahk_exe AetherGazer.exe
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

1_Enable= true 
#IfWinActive ahk_exe AetherGazer.exe
Numpad1:: ;小键盘1 开关
{
    If WinActive("ahk_exe AetherGazer.exe")
    {
        1_Enable :=!1_Enable
        if (1_Enable=true)
        {
            SetTimer, Press1, Off
            ToolTip
        }
        else
        {
            sleep 100
            SetTimer, Press1, 10  ; 
            ToolTip, 金乌：启动, 74, 1021
        }
    }
}

Press1:
    If WinActive("ahk_exe AetherGazer.exe")
    {
        loop{
        If (GetColor(567, 564)=="0xFFFFFF")
        {
            Send, {%Skill3Key%}
            sleep 10
            Send, {%Skill3Key%}
            }
        else
        {
            Break
            }
        }
        Send, {%Skill1Key%}
        sleep 10
        Send, {%Skill1Key%}
        sleep 10
        Send, {%AttackKey%}
        sleep 10
        Send, {%Skill2Key%}
        sleep 10       
        Send, {%UltimateKey%}
        sleep 10
        Send, {%AttackKey%}
        sleep 10
        Send, {%Teammate1Key%}
        sleep 10
        Send, {%AttackKey%}
        sleep 10
        Send, {%Teammate2Key%}
        sleep 10
        Send, {%UltimateKey%}
        sleep 10
        Send, {%AttackKey%}
        sleep 10
    }
    else
    {
        SetTimer, Press1, Off
        ToolTip
    }
return

;------------------------------------------------自动多维变量,要求分辨率1280x720, 小键盘2启动 ↓↓↓
2_Enable=true
#IfWinActive ahk_exe AetherGazer.exe
Numpad2::
{
    If WinActive("ahk_exe AetherGazer.exe")
    {
        2_Enable := !2_Enable
        if (2_Enable=true)
        {
            SetTimer, Press2, Off
            ToolTip
        }
        else
        {
            ToolTip, 多维变量：启动, 74, 1021 ; 设置ToolTip的显示内容和位置坐标
            Sleep 100
            Press2()
        }
    }
}
Press2()
{
        If WinActive("ahk_exe AetherGazer.exe")
    {
        #NoEnv
        SetWorkingDir %A_ScriptDir%
        CoordMode, Mouse, Window
        SendMode Input
        #SingleInstance Force
        SetTitleMatchMode 2
        #WinActivateForce
        SetControlDelay 1
        SetWinDelay 0
        SetKeyDelay -1
        SetMouseDelay -1
        SetBatchLines -1
        WinActivate, AetherGazer ahk_class UnityWndClass
        loop
        {
        ;点击开始挑战
        loop{
            If (GetColor(111, 183)=="0x3D4047")
            break
            }
        Click, 1034, 671
        Loop
        {
            If (GetColor(953, 638) = 0xEBEFF1)  ; 如果获取到的颜色不等于指定的颜色值
                Break  ; 当颜色匹配时退出循环
        }
        ;选择难度
        Loop 2
        {
            Click, 402, 484 Left, Down
            Sleep, 10
            Click, 402, 400, 0
            Sleep, 10
            Click, 402, 100, 0
            Sleep, 10
            Click, 402, 69 Left, Up
        }
        Sleep, 812
        Click, 391, 630
        Sleep, 500
        Click, 1060, 662
        Sleep, 1000        
        ;选择真红
        Click, 329, 636
        Sleep, 500
        Click, 1173, 701
        Sleep, 1000
        ;选择信标
        Loop 2
        {
            Click, 402, 484 Left, Down
            Sleep, 10
            Click, 402, 400, 0
            Sleep, 10
            Click, 402, 100, 0
            Sleep, 10
            Click, 402, 69 Left, Up
        }
        Sleep, 812
        Click, 170, 492
        Sleep, 500
        Click, 483, 221
        Sleep, 500
        Click, 805, 221
        Sleep, 500
        Click, 1183, 702
        Sleep, 500
        ;选珍宝
        loop{
            If (GetColor(713, 555)=="0xE6E6E5")
            break
            }
        Sleep, 500
        Click, 642, 400
        Sleep, 500
        Click, 864, 643
        ;选关卡
        Sleep, 1687
        Send, {w Down}
        Sleep, 3300
        Send, {d Down}
        Sleep, 900
        Send, {d Up}
        Send, {w Up}
        Sleep, 1000
        Click, 889, 490 Left, Down
        Sleep, 93
        Click, 889, 490 Left, Up
        Sleep, 500
        ;打怪
        Loop
        {
            If WinActive("ahk_exe AetherGazer.exe")
            Send, {%Skill1Key%}
            Sleep, 10
            Send, {%Skill3Key%}
            Sleep, 10
            Send, {%AttackKey%}
            Sleep, 10
            Send, {%Skill2Key%}
            Sleep, 10
            Send, {%Skill3Key%}
            Sleep, 10
            Send, {%AttackKey%}
            Sleep, 10
            Send, {%UltimateKey%}
            Sleep, 10
            Send, {%Skill3Key%}
            Sleep, 10
            Send, {%AttackKey%}
            If (GetColor(713, 555)=="0xE6E6E5")
            break
        }
        ;珍宝选择
        Sleep, 500
        Click, 642, 400
        Sleep, 500
        Click, 745, 643
        Sleep, 2000
        ;退出
        Click, 1229, 74
        Sleep, 500
        Click, 1000, 692
        Sleep, 500
        Click, 900, 588
        loop{
            If (GetColor(89, 105)=="0xFFFFFF")
            break
            }
        Click, 1170, 700
        }
        } 
    else
    {
        SetTimer, Press2, Off
        ToolTip
    }
}
return
------------------------------------------------自动探索派遣，小键盘3启动 ↓↓↓
Numpad3::
{
        WinActivate, AetherGazer ahk_class UnityWndClass
        Sleep, 333
        Click, 859, 136 Left, Down
        Sleep, 47
        Click, 859, 136 Left, Up
        Sleep, 5719
        Click, 1055, 125 Left, Down
        Sleep, 63
        Click, 1055, 125 Left, Up
        Sleep, 1187
        Click, 1045, 134 Left, Down
        Sleep, 109
        Click, 1045, 134 Left, Up
        Sleep, 1860
        Click, 873, 381 Left, Down
        Sleep, 94
        Click, 873, 381 Left, Up
        Sleep, 1531
        Click, 1093, 151 Left, Down
        Sleep, 94
        Click, 1093, 151 Left, Up
        Sleep, 375
        Click, 1093, 151 Left, Down
        Sleep, 109
        Click, 1093, 151 Left, Up
        Sleep, 1406
        Click, 451, 418 Left, Down
        Sleep, 78
        Click, 451, 418 Left, Up
        Sleep, 1250
        Click, 1097, 149 Left, Down
        Sleep, 78
        Click, 1097, 149 Left, Up
        Sleep, 297
        Click, 1096, 149 Left, Down
        Sleep, 125
        Click, 1096, 149 Left, Up
        Sleep, 1157
        Click, 415, 165 Left, Down
        Sleep, 78
        Click, 415, 165 Left, Up
        Sleep, 1062
        Click, 1111, 138 Left, Down
        Sleep, 94
        Click, 1111, 138 Left, Up
        Sleep, 203
        Click, 1111, 138 Left, Down
        Sleep, 94
        Click, 1111, 138 Left, Up
        Sleep, 1703
        Click, 664, 291 Left, Down
        Sleep, 94
        Click, 660, 298 Left, Up
        Sleep, 1047
        Click, 1130, 131 Left, Down
        Sleep, 93
        Click, 1130, 131 Left, Up
        Sleep, 157
        Click, 1130, 131 Left, Down
        Sleep, 78
        Click, 1130, 131 Left, Up
        Sleep, 1125
        Click, 845, 143 Left, Down
        Sleep, 93
        Click, 845, 143 Left, Up
        Sleep, 1563
        Click, 829, 683 Left, Down
        Sleep, 78
        Click, 829, 683 Left, Up
        Sleep, 1438
        Click, 870, 375 Left, Down
        Sleep, 109
        Click, 870, 375 Left, Up
        Sleep, 1187
        Click, 940, 244 Left, Down
        Sleep, 79
        Click, 940, 244 Left, Up
        Sleep, 1078
        Click, 832, 672 Left, Down
        Sleep, 78
        Click, 832, 672 Left, Up
        Sleep, 1547
        Click, 438, 432 Left, Down
        Sleep, 78
        Click, 438, 432 Left, Up
        Sleep, 1453
        Click, 922, 235 Left, Down
        Sleep, 94
        Click, 922, 235 Left, Up
        Sleep, 1000
        Click, 827, 679 Left, Down
        Sleep, 78
        Click, 827, 679 Left, Up
        Sleep, 1390
        Click, 643, 280 Left, Down
        Sleep, 79
        Click, 643, 280 Left, Up
        Sleep, 1453
        Click, 821, 243 Left, Down
        Sleep, 78
        Click, 821, 243 Left, Up
        Sleep, 1015
        Click, 819, 679 Left, Down
        Sleep, 79
        Click, 819, 679 Left, Up
        Sleep, 1281
        Click, 413, 169 Left, Down
        Sleep, 62
        Click, 413, 169 Left, Up
        Sleep, 1344
        Click, 828, 238 Left, Down
        Sleep, 78
        Click, 828, 238 Left, Up
        Sleep, 1063
        Click, 870, 681 Left, Down
        Sleep, 78
        Click, 870, 681 Left, Up
}
;------------------------------------------------强制停止脚本，小键盘0停止脚本，再打开需要重启脚本↓↓↓
Numpad0::
    Reload
return


