dim fso: set fso = CreateObject("Scripting.FileSystemObject")
CurrentDirectory = fso.GetAbsolutePathName(".")
batch = CurrentDirectory & "\CSGO_BombAutoLaunch.bat"
Set WshShell = CreateObject("WScript.Shell" )
WshShell.Run chr(34) & batch & Chr(34), 0
Set WshShell = Nothing