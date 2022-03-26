; Loop
; {
;   Sleep 60000 ; wait 1 minute

;   IfWinExist, C:\WINDOWS\system32\cmd.exe - C:\Mining\PhoenixMiner_5.6d_Windows_Real\start_miner.bat
;     {
;       continue
;     }
;   else IfWinExist Insurgency
;     {
;       if WinExist("C:\WINDOWS\system32\cmd.exe - C:\Mining\PhoenixMiner_5.6d_Windows_Real\start_miner.bat")
;       WinClose ; Use the window found by WinExist.
;       continue
;     }
;   else
;     {
;       Run C:\Mining\PhoenixMiner_5.6d_Windows_Real\Custom_Start_Minimized.bat
;     }
; }


Loop
{
  Sleep 15000 ; wait 15 seconds

  ; If Insurgency is running...
  IfWinExist, Insurgency
    {
      ; and miner is running, close miner
      IfWinExist, C:\WINDOWS\system32\cmd.exe - C:\Mining\PhoenixMiner_5.6d_Windows_Real\start_miner.bat
        {
          WinClose
        }
      ; But if just Insurgency is running, do nothing
      else
        {
          continue
        }
    }
    ; If Insurgency is NOT running, and miner IS running, do nothing
    else IfWinExist, C:\WINDOWS\system32\cmd.exe - C:\Mining\PhoenixMiner_5.6d_Windows_Real\start_miner.bat
      {
        continue 
      }
      ; If neither Insurgency nor the miner is running, start the miner
      else
        {
          Run C:\Mining\PhoenixMiner_5.6d_Windows_Real\Custom_Start_Minimized.bat
        }
}