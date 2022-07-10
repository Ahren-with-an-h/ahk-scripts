; Reload script
F8::Reload

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
#SingleInstance force
#Persistent

^F11::
SetFull:
    {
    WinSet, Style, -0xC40000, A
    WinMove, A, , 0, 0, %A_ScreenWidth%, %A_ScreenHeight%
Return
}

^F12::
SetWindow:
    {
    WinSet, Style, +0xC40000, A
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
; # Specific Games
; ##############################

; ### Insurgency ###
#IfWinActive ahk_exe InsurgencyClient-Win64-Shipping.exe

LWin::Return ; disable windows key
RWin::Return ; disable windows key

$LButton:: ; Sends a mouse click and release on press, does not wait for actual release
	Send, {LButton down}
	Random, rand, 10, 50
	Sleep, rand
	Send, {LButton up}
	Return

f23::Hotkey, $LButton, , Off ; mouse6 sends f23 which turns off the hotkey
f24::Hotkey, $LButton, , On ; mouse7 sends f24 to turn it on

; ### Stationeers ###
#IfWinActive ahk_exe rocketstation.exe
XButton2::Send {LButton Down}
