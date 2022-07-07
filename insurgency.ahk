#InstallMouseHook
#UseHook On
#IfWinActive ahk_exe AppName

$xbutton1::msgbox key - xbutton1
$xbutton2::msgbox key - xbutton2
$xbutton3::msgbox key - xbutton3
$xbutton4::msgbox key - xbutton4

$LButton::Click   ; Sends a mouse click and release on press, does not wait for actual release

; Hotkey, $LButton, QuickPress, Off

QuickPress()
{
	Send Click
}
