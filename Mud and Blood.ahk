; Reload script. Press after modifying and saving changes to script to refresh.
; Hotkeys only active for window "Mud and Blood"
; #IfWinActive Mud and Blood
; Move the mouse as fast as possible when clicking at coordinates
SetDefaultMouseSpeed, 0


; $1::
; Send 1
; MouseClick, left
; return

; $2::
; Send 2
; MouseClick, left
; return

; $3::
; Send 3
; MouseClick, left
; return

; q::
; Send 4
; MouseClick, left
; return

; w::
; Send 5
; MouseClick, left
; return

; e::
; Send 6
; MouseClick, left
; return

; t::
; Send 7
; MouseClick, left
; return

MnBCommands := [
    ,{trigger: 1, output: 1}
    ,{trigger: 2, output: 2}
    ,{trigger: 3, output: 3}
    ,{trigger: q, output: 4}
    ,{trigger: w, output: 5}
    ,{trigger: e, output: 6}
    ,{trigger: t, output: 7}]

createMnBHotkey(trigger, output)
{
    HotKey, $%trigger%, moveSoldier
    return
        moveSoldier:
        Send, %output%
        MouseClick, left
        return
}

For index, command in MnBCommands {
    MsgBox, index %index%, command %command.trigger%
    createMnBHotkey(command.trigger, command.output)
}
