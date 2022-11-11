#NoEnv
#Warn
#SingleInstance force
#InstallKeybdHook
#InstallMouseHook
#Persistent
SendMode, Input
SetWorkingDir, %A_ScriptDir%
Menu, Tray, Icon, NGU.ico
SetDefaultMouseSpeed, 0

NguWindow := "ahk_exe NGUIdle.exe"
waittime := 30
toggle := true

gosub Boost
SetTimer, Inventory, 120000

Inventory:
    If (toggle And WinExist(NguWindow) And A_TimeIdlePhysical > 120000)
    gosub Boost
Return

Boost:
    IfWinExist, % NguWindow
    WinActivate

    ; Inventory
    MouseMove, 411, 258
    Click
    Sleep, % waittime
    ; Chest slot
    MouseMove, 928, 222
    Send, a
    Sleep, % waittime
    ; Legs slot
    MouseMove, 926, 310
    Send, a
    Sleep, % waittime
    ; Acc 1 slot
    MouseMove, 838, 143
    Send, a
    Sleep, % waittime
    ; Acc 2 slot
    MouseMove, 841, 224
    Send, a
    Sleep, % waittime
    ; Acc 3 slot
    MouseMove, 840, 316
    Send, a
    Sleep, % waittime
    ; Head slot
    MouseMove, 932, 139
    Send, a
    Sleep, % waittime
    ; Feet slot
    MouseMove, 927, 398
    Send, a
    Sleep, % waittime
    ; Weapon slot
    MouseMove, 1017, 223
    Send, a
    Sleep, % waittime
    ; 1st item slot
    ; MouseMove, 623, 605
    ; Send, a
    ; Sleep, % waittime
    ; 2nd item slot
    MouseMove, 710, 605
    Send, a
    Sleep, % waittime
    ; 3rd item slot
    MouseMove, 797, 605
    Send, a
    Sleep, % waittime
    ; 4th item slot
    MouseMove, 884, 605
    Send, a
    Sleep, % waittime

    ; Cube dump
    MouseMove, 1106, 228
    Send, {RButton}

    IfWinExist, ActiveWindow
    WinActivate, ActiveWindow
Return

F7::Reload ; Reload script
^F7::toggle := False
