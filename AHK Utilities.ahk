#NoEnv
#Warn
#SingleInstance force
#Persistent
#InstallKeybdHook
#InstallMouseHook
SendMode, Input
SetWorkingDir, %A_ScriptDir%
Menu, Tray, Icon, AHK` Utilities.ico

idle_timeout := 30000
ADtoggle := False
ResolutionToggle := False
FullScreenToggle := False

F8::Reload ; Reload script

; F15::MsgBox, F15 pressed

; ### Media Keys (left to right) ###
; SC121:: ; Calculator
SC16B:: Gosub, ToggleResolution ; Explorer
SC16C:: Gosub, ToggleFullScreen ; Email
SC132:: Return ; Web Browser


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
; Mouse 6 & 7 bindings (m6=F24, m7=F23)
f23::Send ^v
f24::Send ^c


; ##############################
; Turn off Monitor with Pause
Pause::
Sleep 1000
SendMessage, 0x112, 0xF170, 2,, Program Manager
return


; ##############################
; Antimatter Dimensions (hold 'm')
f6::
    ADtoggle := !ADtoggle
    if ADtoggle {
        SetTimer, repeat_m, 100
        SetTimer, repeat_s, 60000
    }

    else {
        SetTimer, repeat_m, Off
        SetTimer, repeat_s, Off
    }
Return

repeat_m:
{
    If(A_TimeIdlePhysical > idle_timeout And WinExist("Antimatter Dimensions") ){
        WinActivate
        Send m
    }
    Return
}

repeat_s:
{
    If(A_TimeIdlePhysical > idle_timeout And WinExist("Antimatter Dimensions") ){
        WinActivate
        Send s
    }
    Return
}


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

; ### Polygon ###
#IfWinActive ahk_class UnrealWindow

*LWin::Return ; disable windows key
*RWin::Return ; disable windows key


; ; ### Stationeers ###
; #IfWinActive ahk_exe rocketstation.exe
; XButton2::


; ### Rogue Tower ###
#IfWinActive ahk_exe Rogue Tower.exe

f23::Send e ; paste
f24::Send q ; copy

; ### NGU ###
#IfWinActive ahk_exe NGUIdle.exe

f23::Send d ; combine ; boost
f24::Send a ; boost

; ### Diplomacy is Not an Option ###
#IfWinActive ahk_exe Diplomacy is Not an Option.exe

F12::
    loop 9 {
        send {LButton}
    }
    return
