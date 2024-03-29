#NoEnv
#Warn
#SingleInstance force
#Persistent
#InstallKeybdHook
#InstallMouseHook
SendMode, Input
SetWorkingDir, %A_ScriptDir%
Menu, Tray, Icon, AHK` Utilities.ico
SetTitleMatchMode 2 ; partial window title matches allowed

ResolutionToggle := False
FullScreenToggle := False

F9::Reload ; Reload script

; # Key substitutions #
$`;::Send `:
$+`;::Send `;
; F7::SendRaw, (
; F8::SendRaw, )
; F9::SendRaw, _
; $[::Send, {{}
; $]::Send, {}}
; $+[::Send, {[}
; $+]::Send, {]}

; ### Media Keys (left to right) ###
; SC121:: ; Calculator
; SC16B:: Gosub, ToggleResolution ; Explorer
; SC16C:: Gosub, ToggleFullScreen ; Email
; SC132:: Return ; Web Browser

; # Mouse bindings (m6=F24, m7=F23, m9=f20) #
$*F23::Send ^v
$*F24::Send ^c
$*F20::
    If WinActive("ahk_exe Explorer.EXE") {
        Send, !{f4}
    }
    If WinActive("ahk_exe vlc.exe") {
        Send, !{f4}
    }
    If WinActive("ahk_exe ApplicationFrameHost.exe") {
        Send, !{f4}
    }
    If WinActive("ahk_exe Honeyview.exe") {
        Send, !{f4}
    }
    Return
    
; # Keyboard shortcuts #
^F12::Gosub, ToggleFullScreen
^F11::Gosub, ToggleResolution
^F10::Gosub, TurnOffMonitor

; # Toggle resolution for Mud and Blood #
ToggleResolution:
    If(ResolutionToggle := !ResolutionToggle) {
        ; ChangeResolution(1600, 900)
        ChangeResolution(1280, 720)
    } Else {
        ChangeResolution(2560, 1440)
    }        
Return

ChangeResolution(Screen_Width := 2560, Screen_Height := 1440, Color_Depth := 32, Refresh_Rate := 170)
{
	VarSetCapacity(Device_Mode,156,0)
	NumPut(156,Device_Mode,36) 
	DllCall( "EnumDisplaySettingsA", UInt,0, UInt,-1, UInt,&Device_Mode )
	NumPut(0x5c0000,Device_Mode,40) 
	NumPut(Color_Depth,Device_Mode,104)
	NumPut(Screen_Width,Device_Mode,108)
	NumPut(Screen_Height,Device_Mode,112)
	NumPut(Refresh_Rate,Device_Mode,120)
	Return DllCall( "ChangeDisplaySettingsA", UInt,&Device_Mode, UInt,0 )
}

; # Full Screen #
ToggleFullScreen:
    If(FullScreenToggle := !FullScreenToggle) {
        WinSet, Style, -0xC40000, A
        WinMove, A, , 0, 0, %A_ScreenWidth%, %A_ScreenHeight%
    } Else {
        WinSet, Style, +0xC40000, A
    }        
Return


; ##############################
; Turn off Monitor
TurnOffMonitor:
    Sleep 1000
    SendMessage, 0x112, 0xF170, 2,, Program Manager
Return


; ##############################
; # Pause/Play Youtube
F7::
    IfWinExist, YouTube
    {
        ControlFocus, 
        ControlSend, , k 
        return
    }

; ##############################
; Antimatter Dimensions (hold 'm')
; f6::
;     ADtoggle := !ADtoggle
;     if ADtoggle {
;         SetTimer, repeat_m, 100
;         SetTimer, repeat_s, 60000
;     }

;     else {
;         SetTimer, repeat_m, Off
;         SetTimer, repeat_s, Off
;     }
; Return

; repeat_m:
; {
;     If(A_TimeIdlePhysical > idle_timeout And WinExist("Antimatter Dimensions") ){
;         WinActivate
;         Send m
;     }
;     Return
; }

; repeat_s:
; {
;     If(A_TimeIdlePhysical > idle_timeout And WinExist("Antimatter Dimensions") ){
;         WinActivate
;         Send s
;     }
;     Return
; }


; ##############################
; Turbo Click hold F12
; f12::
; While GetKeyState("f12", "P")
; {
;   MouseClick, left
;   Sleep 40
; }
; return



; TurboToggle := 0
; F10::SetTimer, Turbo, % (TurboToggle := !TurboToggle) ? "3000" : "Off"

; Turbo: 
;   MouseClick, left
; return


; ##############################
; # Specific Applications
; ##############################


; ### Git Bash ###
#IfWinActive ahk_exe mintty.exe
f23::Send !{insert} ; paste
f24::Send ^{insert} ; copy


; ### Polygon ###
#IfWinActive ahk_class UnrealWindow

*LWin::Return ; disable windows key
*RWin::Return ; disable windows key

*1::Send {WheelUp}
*2::Send {WheelDown}


; ; ### Stationeers ###
; #IfWinActive ahk_exe rocketstation.exe
; XButton2::


; ### Rogue Tower ###
#IfWinActive ahk_exe Rogue Tower.exe

f23::Send e ; paste
f24::Send q ; copy


; ### NGU ###
#IfWinActive ahk_exe NGUIdle.exe

F23::Send d ; combine ; boost
F24::Send a ; boost
^F7::
    Loop 10 {
        send {LButton}
    }
    Return

^F8::
    Loop 100 {
        send {LButton}
    }
    Return


; ### Diplomacy is Not an Option ###
#IfWinActive ahk_exe Diplomacy is Not an Option.exe

F6::
    Loop 9 {
        send {LButton}
    }
    Return


; ### Project Quarantine ###
#IfWinActive ahk_exe Test_C.exe

XButton1::
    Send {f down}
    KeyWait, XButton1
    Send {f up}
    return
XButton2::Send v
f24::
    Send {x down}
    KeyWait, f24
    Send {x up}
    return
f23::
    Send {t down}
    KeyWait, f23
    Send {t up}
    return


; ### Satisfactory - hold click for crafting ###
#IfWinActive ahk_exe FactoryGame-Win64-Shipping.exe

F23::MouseClick, left, , , , , D


; ### Evolve ###
#IfWinActive Evolve - Google Chrome
F24::
    Loop 10 {
        send {LButton}
    sleep 10
    }
    Return

F23::
    Loop 100 {
        send {LButton}
    sleep 10
    }
    Return


; ### (the) Gnorp Apologue ###
#IfWinActive ahk_exe (the) Gnorp Apologue.exe

$*F23::Send {Click down}
$*F24::Send {Click up}

