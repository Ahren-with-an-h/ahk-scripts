; Reload script. Press after modifying and saving changes to script to refresh.
F7::Reload
; Hotkeys only active for window "Mud and Blood"
#IfWinActive Mud and Blood
; Move the mouse as fast as possible when clicking at coordinates
SetDefaultMouseSpeed, 0


; q-y selects troop 1-6 and sends them to the current mouse location. i for whole squad.
$1::
Send 1
MouseClick, left
return

$2::
Send 2
MouseClick, left
return

$3::
Send 3
MouseClick, left
return

q::
Send 4
MouseClick, left
return

w::
Send 5
MouseClick, left
return

e::
Send 6
MouseClick, left
return

t::
Send 7
MouseClick, left
return