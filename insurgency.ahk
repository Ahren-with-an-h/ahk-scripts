f7::Reload ; Reload script

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
