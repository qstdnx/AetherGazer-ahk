; ----------------------------------------------------------------------------
; Script Name: 深空之眼
; Version: 2.6
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
global LingguangKey := "Numpad3"
global TuoteKey := "Numpad4"
global NameiKey := "Numpad5"
global WeierKey := "Numpad6"
global KaorouKey := "Numpad7"
global LiandianKey := "Numpad9"
global FantianKey := "^Numpad1"
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
        IniRead, LingguangKey, %IniFilePath%, Hotkeys, LingguangKey
        IniRead, TuoteKey, %IniFilePath%, Hotkeys, TuoteKey
        IniRead, NameiKey, %IniFilePath%, Hotkeys, NameiKey
        IniRead, WeierKey, %IniFilePath%, Hotkeys, WeierKey
        IniRead, KaorouKey, %IniFilePath%, Hotkeys, KaorouKey
        IniRead, LiandianKey, %IniFilePath%, Hotkeys, LiandianKey
        IniRead, FantianKey, %IniFilePath%, Hotkeys, FantianKey
        IniRead, StopscriptKey, %IniFilePath%, Hotkeys, StopscriptKey
    }
    
Hotkey, %JinwuKey%, Jinwu
Hotkey, %DimensionKey%, Dimension
Hotkey, %LingguangKey%, Lingguang
Hotkey, %TuoteKey%, Tuote
Hotkey, %NameiKey%, Namei
Hotkey, %WeierKey%, Weier
Hotkey, %KaorouKey%, Kaorou
Hotkey, %LiandianKey%, Liandian
Hotkey, %FantianKey%, Fantian
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
    Gui, Add, Text,, 陵光自动战斗快捷键:
    Gui, Add, Hotkey, vLingguangKey, %LingguangKey%
    Gui, Add, Text,, 托特和哈迪斯自动战斗快捷键:
    Gui, Add, Hotkey, vTuoteKey, %TuoteKey%
    Gui, Add, Text,, 娜美自动战斗快捷键:
    Gui, Add, Hotkey, vNameiKey, %NameiKey%
    Gui, Add, Text,, 光薇儿自动战斗快捷键:
    Gui, Add, Hotkey, vWeierKey, %WeierKey%
    Gui, Add, Text,, 自动烤肉快捷键:
    Gui, Add, Hotkey, vKaorouKey, %KaorouKey%
    Gui, Add, Text,, 简易连点器快捷键:
    Gui, Add, Hotkey, vLiandianKey, %LiandianKey%
    Gui, Add, Text,, 梵天自动战斗快捷键:
    Gui, Add, Hotkey, vFantianKey, %FantianKey%
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
    IniWrite, %LingguangKey%, %IniFilePath%, Hotkeys, LingguangKey
    IniWrite, %TuoteKey%, %IniFilePath%, Hotkeys, TuoteKey
    IniWrite, %NameiKey%, %IniFilePath%, Hotkeys, NameiKey
    IniWrite, %WeierKey%, %IniFilePath%, Hotkeys, WeierKey
    IniWrite, %KaorouKey%, %IniFilePath%, Hotkeys, KaorouKey
    IniWrite, %LiandianKey%, %IniFilePath%, Hotkeys, LiandianKey
    IniWrite, %FantianKey%, %IniFilePath%, Hotkeys, FantianKey
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
    LingguangKey := LingguangKey
    TuoteKey := TuoteKey
    NameiKey := NameiKey
    WeierKey := WeierKey
    KaorouKey := KaorouKey
    LiandianKey := LiandianKey
    FantianKey := FantianKey
    StopscriptKey := StopscriptKey
    Hotkey, %JinwuKey%, Jinwu
    Hotkey, %DimensionKey%, Dimension
    Hotkey, %LingguangKey%, Lingguang
    Hotkey, %TuoteKey%, Stopscript
    Hotkey, %TuoteKey%, Tuote
    Hotkey, %NameiKey%, Namei
    Hotkey, %WeierKey%, Weier
    Hotkey, %KaorouKey%, Kaorou
    Hotkey, %LiandianKey%, Liandian
    Hotkey, %FantianKey%, FantianKey
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
------------------------------------------------陵光自动操作，小键盘3启动 ↓↓↓
3_Enable= False 
#If WinActive("ahk_exe AetherGazer.exe") || WinActive("ahk_exe AetherGazer_Bili.exe")
Lingguang: 
{
    If WinActive("ahk_exe AetherGazer.exe") or WinActive("ahk_exe AetherGazer_Bili.exe")
    {
        3_Enable :=!3_Enable
        if (3_Enable=False)
        {
            SetTimer, Press3, Off
            ToolTip
        }
        else
        {
            sleep 100
            SetTimer, Press3, 10  ; 
            ToolTip, 陵光：启动, 74, 1021
        }
    }
}

Press3:
    If WinActive("ahk_exe AetherGazer.exe") or WinActive("ahk_exe AetherGazer_Bili.exe")
    {
        Send, {%AttackKey%}
        sleep 250
        Send, {%Skill1Key%}
        sleep 250     
        Send, {%UltimateKey%}
        Send, {%Teammate1Key%}
        Send, {%Teammate2Key%}
    }
    else
    {
        SetTimer, Press3, Off
        ToolTip
        1_Enable= False 
    }
return

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
        if (5_Enable=False)
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
        SetTimer, Press6, Off
        ToolTip
        6_Enable= False
    }
return
;------------------------------------------------闲暇时刻自动烤肉，小键盘7启动↓↓↓
7_Enable= False 
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
        if (IsColorClose(color, "0x4abbf1", 10))  ; 容差设为10
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
;--------------------------简易连点器功能，右ctrl+任意键连点，小键盘9启动自定义连点↓↓↓
9_Enable := false
Inputkey := ""
RControl::
    Input, Inputkey, L1 I V, {MouseX, MouseY}
    9_Enable := true
    Loop {
        If WinActive("ahk_exe AetherGazer.exe") or WinActive("ahk_exe AetherGazer_Bili.exe"){
        if (9_Enable){
            Send, %Inputkey%
            Sleep, 50
            Tooltip, %Inputkey% 键连点中，按%StopscriptKey%停止
            }
            if (!9_Enable or Inputkey=""){
            Tooltip
            break
            }
        } else {
        9_Enable := false
        Tooltip
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
    If WinActive("ahk_exe AetherGazer.exe") or WinActive("ahk_exe AetherGazer_Bili.exe")
    Gosub, 连点弹框输入
    Return
}
连点弹框输入:
    Gui, MouseClickgui: New
    Gui, MouseClickgui: +AlwaysOnTop
    Gui, MouseClickgui: Add, Text, , 填写连点的按键：`n同时连按多个按键直接填入即可，例如填入jkio为同时连点jkio四个按键`n特殊按键用{}圈住，例如鼠标左键为{LButton}，空格键为{Space}，左shift为{LShift}
    Gui, MouseClickgui: Add, Edit, w400 v连点按键, {LButton}
    Gui, MouseClickgui: Add, Text, , 连点间隔（单位毫秒）：
    Gui, MouseClickgui: Add, Edit, w400 v连点间隔, 50
    Gui, MouseClickgui: Add, Button, Default g连点确认, 确认
    Gui, MouseClickgui: Show, , 按键连点
Return
连点确认:
    Gui, MouseClickgui: Submit
    global WhichButton:= 连点按键
    global interval:= 连点间隔
    SetTimer, ContinuousClick, %连点间隔%
    return
    
ContinuousClick:
    If WinActive("ahk_exe AetherGazer.exe") or WinActive("ahk_exe AetherGazer_Bili.exe")
    send, %WhichButton%
    ToolTip,%WhichButton%键连点中，`n间隔%interval%毫秒，按%StopscriptKey%停止
    return

;------------------------------------------------梵天自动战斗,Ctrl+小键盘1启动 ↓↓↓
11_Enable= False 
#If WinActive("ahk_exe AetherGazer.exe") || WinActive("ahk_exe AetherGazer_Bili.exe")
Fantian: 
{
    If WinActive("ahk_exe AetherGazer.exe") or WinActive("ahk_exe AetherGazer_Bili.exe")
    {
        11_Enable :=!11_Enable
        if (11_Enable=False)
        {
            SetTimer, Press11, Off
            ToolTip
        }
        else
        {
            sleep 100
            SetTimer, Press11, 10  ; 
            ToolTip, 梵天：启动, 74, 1021
        }
    }
}

Press11:
    If WinActive("ahk_exe AetherGazer.exe") or WinActive("ahk_exe AetherGazer_Bili.exe")
    {
        If (GetColor(898, 681)!=="0xFFFFFF" and GetColor(1218, 681)=="0xFFFFFF")
        {
            Send, {%DodgeKey% Down}
            Sleep, 500
            Send, {%DodgeKey% Up}
            }
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
        Send, {%Teammate2Key%}
        sleep 5
        Send, {%Skill1Key%}
        sleep 5
        Send, {%AttackKey%}
        sleep 5
        Send, {%Skill2Key%}
        sleep 5
    }
    else
    {
        SetTimer, Press11, Off
        ToolTip
        11_Enable= False
    }
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
    11_Enable= False
return
