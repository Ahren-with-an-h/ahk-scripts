; Reload script
F8::Reload

; Turn off Monitor with Pause
Pause::
Sleep 1000
SendMessage, 0x112, 0xF170, 2,, Program Manager
return

; Full screen
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

