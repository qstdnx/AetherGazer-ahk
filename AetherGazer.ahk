; ----------------------------------------------------------------------------
; Script Name: 深空之眼
; Version: 2.4
; Author: qstdnx
; Contact: https://github.com/qstdnx/AetherGazer-ahk/issues
; ----------------------------------------------------------------------------
#Persistent             ;~让脚本持久运行
#SingleInstance,Force   ;~运行替换旧实例
ListLines,Off           ;~不显示最近执行的脚本行
SetBatchLines,-1        ;~脚本全速执行(默认10ms)
CoordMode,menu,Window   ;~坐标相对活动窗口
;------------------------------------------------设置 ↓↓↓
; 初始化快捷键
global AttackKey := "j"
global Skill1Key := "u"
global Skill2Key := "i"
global Skill3Key := "o"
global DodgeKey := "Space"
global UltimateKey := "r"
global Teammate1Key := "1"
global Teammate2Key := "2"
global JinwuKey := "Numpad1"
global DimensionKey := "Numpad2"
global ExploreKey := "Numpad3"
global TuoteKey := "Numpad4"
global NameiKey := "Numpad5"
global WeierKey := "Numpad6"
global KaorouKey := "Numpad7"
global StopscriptKey := "Numpad0"
global ScriptDir := A_ScriptDir
IniFilePath := ScriptDir . "\settings.ini"

        if FileExist(IniFilePath) {
        IniRead, AttackKey, %IniFilePath%, Hotkeys, AttackKey
        IniRead, Skill1Key, %IniFilePath%, Hotkeys, Skill1Key 
        IniRead, Skill2Key, %IniFilePath%, Hotkeys, Skill2Key
        IniRead, Skill3Key, %IniFilePath%, Hotkeys, Skill3Key
        IniRead, DodgeKey, %IniFilePath%, Hotkeys, DodgeKey
        IniRead, UltimateKey, %IniFilePath%, Hotkeys, UltimateKey
        IniRead, Teammate1Key, %IniFilePath%, Hotkeys, Teammate1Key
        IniRead, Teammate2Key, %IniFilePath%, Hotkeys, Teammate2Key
        IniRead, JinwuKey, %IniFilePath%, Hotkeys, JinwuKey
        IniRead, DimensionKey, %IniFilePath%, Hotkeys, DimensionKey
        IniRead, ExploreKey, %IniFilePath%, Hotkeys, ExploreKey
        IniRead, TuoteKey, %IniFilePath%, Hotkeys, TuoteKey
        IniRead, NameiKey, %IniFilePath%, Hotkeys, NameiKey
        IniRead, WeierKey, %IniFilePath%, Hotkeys, WeierKey
        IniRead, KaorouKey, %IniFilePath%, Hotkeys, KaorouKey
        IniRead, StopscriptKey, %IniFilePath%, Hotkeys, StopscriptKey
    }
    
Hotkey, %JinwuKey%, Jinwu
Hotkey, %DimensionKey%, Dimension
Hotkey, %ExploreKey%, Explore
Hotkey, %TuoteKey%, Tuote
Hotkey, %NameiKey%, Namei
Hotkey, %WeierKey%, Weier
Hotkey, %KaorouKey%, Kaorou
Hotkey, %StopscriptKey%, Stopscript


Menu, Tray, Add, 快捷键设置, ShowSettingsGUI
ShowSettingsGUI() {
    Gui, New
;Gui, Add, Text,, 模式
    ;Gui, Add, DropDownList, vColorChoice, Black|White|Red|Green|Blue
    Gui, Add, Text,, 普攻快捷键:
    Gui, Add, Hotkey, vAttackKey, %AttackKey%
    Gui, Add, Text,, 1 技能快捷键:
    Gui, Add, Hotkey, vSkill1Key, %Skill1Key%
    Gui, Add, Text,, 2 技能快捷键:
    Gui, Add, Hotkey, vSkill2Key, %Skill2Key%
    Gui, Add, Text,, 3 技能快捷键:
    Gui, Add, Hotkey, vSkill3Key, %Skill3Key%
    Gui, Add, Text,, 闪避快捷键:
    Gui, Add, Hotkey, vDodgeKey, %DodgeKey%
    Gui, Add, Text,, 奥义快捷键:
    Gui, Add, Hotkey, vUltimateKey, %UltimateKey%
    Gui, Add, Text,, 队友1 奥义快捷键:
    Gui, Add, Hotkey, vTeammate1Key, %Teammate1Key%
    Gui, Add, Text,, 队友2 奥义快捷键:
    Gui, Add, Hotkey, vTeammate2Key, %Teammate2Key%
    Gui, Add, Text,, 金乌自动战斗快捷键:
    Gui, Add, Hotkey, vJinwuKey, %JinwuKey%
    Gui, Add, Text,, 自动多维变量快捷键:
    Gui, Add, Hotkey, vDimensionKey, %DimensionKey%
    Gui, Add, Text,, 自动探索快捷键:
    Gui, Add, Hotkey, vExploreKey, %ExploreKey%
    Gui, Add, Text,, 托特和哈迪斯自动战斗快捷键:
    Gui, Add, Hotkey, vTuoteKey, %TuoteKey%
    Gui, Add, Text,, 娜美自动战斗快捷键:
    Gui, Add, Hotkey, vNameiKey, %NameiKey%
    Gui, Add, Text,, 光薇儿自动战斗快捷键:
    Gui, Add, Hotkey, vWeierKey, %WeierKey%
    Gui, Add, Text,, 自动烤肉快捷键:
    Gui, Add, Hotkey, vKaorouKey, %KaorouKey%
    Gui, Add, Text,, 停止脚本快捷键:
    Gui, Add, Hotkey, vStopscriptKey, %StopscriptKey%
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
    IniWrite, %AttackKey%, %IniFilePath%, Hotkeys, AttackKey
    IniWrite, %Skill1Key%, %IniFilePath%, Hotkeys, Skill1Key
    IniWrite, %Skill2Key%, %IniFilePath%, Hotkeys, Skill2Key
    IniWrite, %Skill3Key%, %IniFilePath%, Hotkeys, Skill3Key
    IniWrite, %DodgeKey%, %IniFilePath%, Hotkeys, DodgeKey
    IniWrite, %UltimateKey%, %IniFilePath%, Hotkeys, UltimateKey
    IniWrite, %Teammate1Key%, %IniFilePath%, Hotkeys, Teammate1Key
    IniWrite, %Teammate2Key%, %IniFilePath%, Hotkeys, Teammate2Key
    IniWrite, %JinwuKey%, %IniFilePath%, Hotkeys, JinwuKey
    IniWrite, %DimensionKey%, %IniFilePath%, Hotkeys, DimensionKey
    IniWrite, %ExploreKey%, %IniFilePath%, Hotkeys, ExploreKey
    IniWrite, %TuoteKey%, %IniFilePath%, Hotkeys, TuoteKey
    IniWrite, %NameiKey%, %IniFilePath%, Hotkeys, NameiKey
    IniWrite, %WeierKey%, %IniFilePath%, Hotkeys, WeierKey
    IniWrite, %KaorouKey%, %IniFilePath%, Hotkeys, KaorouKey
    IniWrite, %StopscriptKey%, %IniFilePath%, Hotkeys, StopscriptKey
    ; 更新全局变量
    AttackKey := AttackKey
    Skill1Key := Skill1Key
    Skill2Key := Skill2Key
    Skill3Key := Skill3Key
    DodgeKey := DodgeKey
    UltimateKey := UltimateKey
    Teammate1Key := Teammate1Key
    Teammate2Key := Teammate2Key
    JinwuKey := JinwuKey
    DimensionKey := DimensionKey
    ExploreKey := ExploreKey
    TuoteKey := TuoteKey
    NameiKey := NameiKey
    WeierKey := WeierKey
    KaorouKey := KaorouKey
    StopscriptKey := StopscriptKey
    Hotkey, %JinwuKey%, Jinwu
    Hotkey, %DimensionKey%, Dimension
    Hotkey, %ExploreKey%, Explore
    Hotkey, %TuoteKey%, Stopscript
    Hotkey, %TuoteKey%, Tuote
    Hotkey, %NameiKey%, Namei
    Hotkey, %WeierKey%, Weier
    Hotkey, %KaorouKey%, Kaorou
    Hotkey, %StopscriptKey%, Stopscript
    

Return

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

1_Enable= False 
#If WinActive("ahk_exe AetherGazer.exe") || WinActive("ahk_exe AetherGazer_Bili.exe")
Jinwu: 
{
    If WinActive("ahk_exe AetherGazer.exe") or WinActive("ahk_exe AetherGazer_Bili.exe")
    {
        1_Enable :=!1_Enable
        if (1_Enable=False)
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
    If WinActive("ahk_exe AetherGazer.exe") or WinActive("ahk_exe AetherGazer_Bili.exe")
    {
        loop{
        If (GetColor(1162, 693)=="0xFFFFFF")
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
        Send, {%AttackKey%}
        sleep 10
    }
    else
    {
        SetTimer, Press1, Off
        ToolTip
        1_Enable= False 
    }
return

;------------------------------------------------自动多维变量,要求分辨率1280x720, 小键盘2启动 ↓↓↓
2_Enable=False
#If WinActive("ahk_exe AetherGazer.exe") || WinActive("ahk_exe AetherGazer_Bili.exe")
Dimension:
{
    If WinActive("ahk_exe AetherGazer.exe") or WinActive("ahk_exe AetherGazer_Bili.exe")
    {
        2_Enable := !2_Enable
        if (2_Enable=False)
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
        If WinActive("ahk_exe AetherGazer.exe") or WinActive("ahk_exe AetherGazer_Bili.exe")
    {
        #NoEnv
        SetWorkingDir %A_ScriptDir%
        CoordMode, Mouse, Window
        SendMode Input
        SetTitleMatchMode 2
        #WinActivateForce
        SetControlDelay 1
        SetWinDelay 0
        SetKeyDelay -1
        SetMouseDelay -1
        loop
        {
        ;点击开始挑战
        loop{
            If (GetColor(111, 183)=="0x3D4047" or GetColor(1074, 451)=="0xFFFFFF" or GetColor(101, 528)=="0xFFFFFF")
            break
            }
        Click, 1034, 671
        ;难度选择
        Sleep, 500
Click, 562, 674 Left, Down
Sleep, 78
Click, 563, 659, 0
Click, 563, 650, 0
Sleep, 31
Click, 556, 549, 0
Click, 550, 507, 0
Click, 543, 447, 0
Sleep, 16
Click, 542, 430, 0
Click, 539, 395, 0
Sleep, 16
Click, 530, 128, 0
Sleep, 15
Click, 530, 89, 0
Click, 536, -7, 0
Sleep, 16
Click, 542, -63, 0
Click, 551, -120, 0
Sleep, 15
Click, 593, -169, 0
Sleep, 16
Click, 600, -169, 0
Click, 600, -169 Left, Up
        Sleep, 812
        Click, 391, 630
        Sleep, 500
        Click, 1060, 662
        Sleep, 1000        
        ;选择真红
        Click, 71, 707
        Sleep, 500
        Click, 112, 165
        Sleep, 500
        Click, 133, 316
        ;选物理系有些人会选不到
        ;Sleep, 500
        ;Click, 123, 587
        Sleep, 500
        Click, 235, 702
        Sleep, 500
        CoordMode, Pixel, Window
        PicFilePath := ScriptDir . "\1.bmp"
        ImageSearch, FoundX, FoundY, 47, 165, 427, 671, *140 %PicFilePath%
        If ErrorLevel = 0
            Click, %FoundX%, %FoundY% Left, 1
        Sleep, 500
        Click, 1173, 701
        Sleep, 1000
        ;选择信标
Click, 628, 562 Left, Down
Sleep, 125
Click, 628, 549, 0
Click, 628, 546, 0
Sleep, 16
Click, 628, 521, 0
Click, 628, 508, 0
Sleep, 16
Click, 628, 457, 0
Click, 628, 436, 0
Sleep, 15
Click, 628, 362, 0
Click, 628, 335, 0
Sleep, 16
Click, 626, 240, 0
Click, 626, 224, 0
Sleep, 15
Click, 619, -9, 0
Click, 618, -54, 0
Sleep, 16
Click, 618, -110, 0
Sleep, 16
Click, 618, -110 Left, Up
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
            If (GetColor(713, 555)=="0xE6E6E5" or GetColor(551, 270)=="0xE7E2DC" or GetColor(1162, 642)=="0xFFFFFF")
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
        Sleep, 1200
        Send, {d Up}
        sleep, 400
        Send, {w Up}
        Sleep, 1000
        Click, 889, 490 Left, Down
        Sleep, 93
        Click, 889, 490 Left, Up
        Sleep, 500
        ;打怪
        Loop
        {
            If WinActive("ahk_exe AetherGazer.exe") or WinActive("ahk_exe AetherGazer_Bili.exe")
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
            If (GetColor(713, 555)=="0xE6E6E5" or GetColor(1162, 642)=="0xFFFFFF" or GetColor(631, 639)=="0xFFFFFF")
            break
        }
        ;珍宝选择
        Sleep, 500
        Click, 642, 400
        Sleep, 500
        Click, 745, 643
        Sleep, 2000
        ;退出
        Send, {Alt}
        Sleep, 500
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
        Sleep, 2000
        }
        } 
    else
    {
        SetTimer, Press2, Off
        ToolTip
		2_Enable=False
    }
}
return
------------------------------------------------自动探索派遣，小键盘3启动 ↓↓↓
#If WinActive("ahk_exe AetherGazer.exe") || WinActive("ahk_exe AetherGazer_Bili.exe")
Explore:
{
        Sleep, 333
        Click, 859, 136 Left, Down
        Sleep, 47
        Click, 859, 136 Left, Up
        Sleep, 2719
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
;------------------------------------------------托特或哈迪斯自动战斗,小键盘4启动 ↓↓↓

4_Enable= False 
#If WinActive("ahk_exe AetherGazer.exe") || WinActive("ahk_exe AetherGazer_Bili.exe")
Tuote: 
{
    If WinActive("ahk_exe AetherGazer.exe") or WinActive("ahk_exe AetherGazer_Bili.exe")
    {
        4_Enable :=!4_Enable
        if (4_Enable=False)
        {
            SetTimer, Press4, Off
            ToolTip
        }
        else
        {
            sleep 100
            SetTimer, Press4, 10  ; 
            ToolTip, 托特或哈迪斯：启动, 74, 1021
        }
    }
}

Press4:
    If WinActive("ahk_exe AetherGazer.exe") or WinActive("ahk_exe AetherGazer_Bili.exe")
    {
        Send, {%AttackKey% Down}
        Sleep, 500
        Send, {%AttackKey% Up}
        Send, {%Skill3Key%}
        sleep 10
        Send, {%Skill3Key%}
        sleep 10
        Send, {%AttackKey%}
        sleep 10
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
        Send, {%Teammate2Key%}
        sleep 10
    }
    else
    {
        SetTimer, Press4, Off
        ToolTip
        4_Enable= False
    }
return
;------------------------------------------------娜美自动战斗,小键盘5启动 ↓↓↓
5_Enable= False 
#If WinActive("ahk_exe AetherGazer.exe") || WinActive("ahk_exe AetherGazer_Bili.exe")
Namei: 
{
    If WinActive("ahk_exe AetherGazer.exe") or WinActive("ahk_exe AetherGazer_Bili.exe")
    {
        5_Enable :=!5_Enable
        if (5_Enable=true)
        {
            SetTimer, Press5, Off
            ToolTip
        }
        else
        {
            sleep 100
            Send, {%Skill1Key%}{%AttackKey%}
            SetTimer, Press5, 10  ; 
            ToolTip, 娜美：启动, 74, 1021
        }
    }
}

Press5:
    If WinActive("ahk_exe AetherGazer.exe")
    {
        If (GetColor(1174, 684)=="0xFFFFFF")
        {
             send, {%DodgeKey%}
             sleep 400
             Send, {%AttackKey%}
             sleep 300
             Send, {%AttackKey%}
             sleep 700
             Send, {%AttackKey%}
             sleep 600
             Send, {%Skill3Key%}
             sleep 1400
             Send, {%Skill2Key%}{%Skill1Key%}
             }  
        sleep 10
        Send, {%AttackKey%}
        If (GetColor(1090, 672)=="0xFFFFFF")
        {
            sleep 150
            Send, {%Skill2Key%}
            }
        sleep 10
        Send, {%AttackKey%}
        If (GetColor(1016, 697)=="0xFFFFFF")
        {
            sleep 150
            Send, {%Skill1Key%}
            }
        Send, {%UltimateKey%}
        sleep 10
        Send, {%AttackKey%}
        sleep 10
        Send, {%Teammate1Key%}
        sleep 10
        Send, {%Teammate2Key%}
        sleep 10
    }
    else
    {
        SetTimer, Press5, Off
        ToolTip
        5_Enable= False 
    }
return
;------------------------------------------------光薇儿自动战斗,小键盘6启动 ↓↓↓
6_Enable= False 
#If WinActive("ahk_exe AetherGazer.exe") || WinActive("ahk_exe AetherGazer_Bili.exe")
Weier: 
{
    If WinActive("ahk_exe AetherGazer.exe") or WinActive("ahk_exe AetherGazer_Bili.exe")
    {
        6_Enable :=!6_Enable
        if (6_Enable=False)
        {
            SetTimer, Press6, Off
            ToolTip
        }
        else
        {
            sleep 100
            SetTimer, Press6, 10  ; 
            ToolTip, 光薇儿：启动, 74, 1021
        }
    }
}

Press6:
    If WinActive("ahk_exe AetherGazer.exe") or WinActive("ahk_exe AetherGazer_Bili.exe")
    {
        Send, {%Skill3Key%}
        sleep 5
        Send, {%AttackKey%}
        sleep 5
        Send, {%Skill1Key%}
        sleep 5
        Send, {%UltimateKey%}
        sleep 5
        Send, {%AttackKey%}
        sleep 5
        Send, {%Skill2Key%}
        sleep 5
        Send, {%Teammate1Key%}
        sleep 5
        Send, {%Skill1Key%}
        sleep 5
        Send, {%Teammate2Key%}
        sleep 5
        Send, {%Skill2Key%}
        sleep 5
    }
    else
    {
        SetTimer, Press4, Off
        ToolTip
        6_Enable= False
    }
return
;------------------------------------------------闲暇时刻自动烤肉，小键盘7启动↓↓↓
Kaorou: 
{
    If WinActive("ahk_exe AetherGazer.exe") or WinActive("ahk_exe AetherGazer_Bili.exe")
    {
        7_Enable := !7_Enable
        if (7_Enable = False)
        {
            SetTimer, Press7, Off
            ToolTip
        }
        else
        {
            Sleep 100
            SetTimer, Press7, 10
            ToolTip, 烤肉：启动, 74, 1021
        }
    }
}

Press7:
    If WinActive("ahk_exe AetherGazer.exe") or WinActive("ahk_exe AetherGazer_Bili.exe")
    {
        color := GetColor(691, 180)
        if (IsColorClose(color, "0xde6566", 10))  ; 容差设为10
        {
            Send, i
        }
        else if (IsColorClose(color, "0x4abbf1", 10))  ; 容差设为10
        {
            Send, u
        }
    }
    else
    {
        SetTimer, Press7, Off
        ToolTip
        7_Enable = False
    }
return

; 判断两个颜色值是否在容差范围内
IsColorClose(color1, color2, tolerance)
{
    color1 := "0x" SubStr(color1, 3)
    color2 := "0x" SubStr(color2, 3)
    
    r1 := (color1 >> 16) & 0xFF
    g1 := (color1 >> 8) & 0xFF
    b1 := color1 & 0xFF
    
    r2 := (color2 >> 16) & 0xFF
    g2 := (color2 >> 8) & 0xFF
    b2 := color2 & 0xFF
    
    if (Abs(r1 - r2) <= tolerance && Abs(g1 - g2) <= tolerance && Abs(b1 - b2) <= tolerance)
    {
        return true
    }
    return false
}

;------------------------------------------------强制停止脚本，小键盘0↓↓↓
Stopscript:
    Reload
    1_Enable= False
    2_Enable= False
    4_Enable= False
    5_Enable= False
    6_Enable= False
    7_Enable= False
return
