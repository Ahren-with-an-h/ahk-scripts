#NoEnv
#Warn
#SingleInstance force
#Persistent
SendMode, Input
SetWorkingDir, %A_ScriptDir%
Menu, Tray, Icon, NGU.ico
SetDefaultMouseSpeed, 0

Sleep 3000
SetTimer, boost, 60000


; inf_cube:
; {
;     If WinExist("ahk_exe NGUIdle.exe") And A_TimeIdlePhysical > 2000
;     {
;         WinActivate
;         MouseMove, 1106, 228
;         Send, {RButton}
;     }
; }
; Return

boost:
{
    If WinExist("ahk_exe NGUIdle.exe") And A_TimeIdlePhysical > 2000
    {
        WinActivate
        ; Head slot
        MouseMove, 932, 139
        Send, a
        Sleep, 500
        ; 1st item slot
        MouseMove, 623, 605
        Send, a
        Sleep, 500
        ; Cube dump
        MouseMove, 1106, 228
        Send, {RButton}
    }

    ; Sleep, 3000
    ; gosub inf_cube
}
Return

F7::Reload ; Reload script
^F7::ExitApp ; Exit script
