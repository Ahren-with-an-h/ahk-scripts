f6::
Loop, 136
{
        
    if WinExist("Attendant Raw.txt")
        WinActivate ; Use the window found by WinExist.
    else
        return

    Send, ^c
    Send, {Down}
    Sleep 10

    if WinExist("ACD Numbers")
        WinActivate ; Use the window found by WinExist.
    else
        return

    Send, ^v
    Send, {Tab}
    Sleep 10

    if WinExist("Attendant Raw.txt")
        WinActivate ; Use the window found by WinExist.
    else
        return

    Send, ^c
    Send, {Down}{Down}
    Sleep 10

    if WinExist("ACD Numbers")
        WinActivate ; Use the window found by WinExist.
    else
        return

    Send, ^v
    Send, {Enter}
    Sleep 10

}

return