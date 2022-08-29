; ### Stop miner if app in list is running. Start miner when neither miner nor game in list is running.

miner := {"title": "C:\WINDOWS\system32\cmd.exe - C:\Mining\PhoenixMiner_5.6d_Windows_Real\start_miner.bat"
        , "path": "C:\Mining\PhoenixMiner_5.6d_Windows_Real\Custom_Start_Minimized.bat"}
games := ["Insurgency: Sandstorm", "DOS"]

SetTimer, Status_Check, 10000

Status_Check:
  gameIsRunning := AnyWinOfExist(games)
  if(gameIsRunning && WinExist(miner.title)){
      WinClose, % miner.title
  } else if(!gameIsRunning && !WinExist(miner.title)){
      Run, % miner.path
  }
return

AnyWinOfExist(obj){
    for index, title in obj{
        if(hwnd := WinExist(title))
            return, hwnd
    }
    return, False
}
