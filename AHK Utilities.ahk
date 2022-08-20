#NoEnv
#Warn
#SingleInstance force
#Persistent
SendMode, Input
SetWorkingDir, %A_ScriptDir%
Menu, Tray, Icon, AHK` Utilities.ico

F8::Reload ; Reload script

; ### Media Keys (left to right) ###
; SC121::
; SC16B::
; SC16C::
; SC132::

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
; Full Screen (ctrl+F11 = full screen, ctrl+F12 = revert)
^F11::
    WinSet, Style, -0xC40000, A
    WinMove, A, , 0, 0, %A_ScreenWidth%, %A_ScreenHeight%
	Return


^F12::
    WinSet, Style, +0xC40000, A
	Return


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

; ### Insurgency ###
#IfWinActive ahk_exe InsurgencyClient-Win64-Shipping.exe

*LWin::Return ; disable windows key
*RWin::Return ; disable windows key
$*LButton::Click ; Sends a mouse click and release on press. '*' ignores modifiers
f23::Hotkey, $*LButton, , Off ; mouse6 sends f23 which turns off the hotkey
f24::Hotkey, $*LButton, , On ; mouse7 sends f24 to turn it on

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

; ### Rogue Tower ###
#IfWinActive ahk_exe NGUIdle.exe

f23::Send d ; combinea ; boost
f24::Send a ; boost
