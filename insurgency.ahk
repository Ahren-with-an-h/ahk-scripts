#NoEnv
#Warn
#SingleInstance force
#Persistent
SendMode, Input
SetWorkingDir, %A_ScriptDir%
Menu, Tray, Icon, Insurgency.ico

#IfWinActive ahk_exe InsurgencyClient-Win64-Shipping.exe

*LWin::Return ; disable windows key
*RWin::Return ; disable windows key
$*LButton::Click ; Sends a mouse click and release on press. '*' ignores modifiers
*f23::Hotkey, $*LButton, , Off ; mouse6 sends f23 which turns off the hotkey
*f24::Hotkey, $*LButton, , On ; mouse7 sends f24 to turn it on
