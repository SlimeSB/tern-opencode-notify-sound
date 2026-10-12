' wscript is a windowless host: the PowerShell that holds the .NET SoundPlayer
' runs with window style 0, so no console window flashes.
Option Explicit
Dim shell, path
If WScript.Arguments.Count < 1 Then WScript.Quit 1
path = Replace(WScript.Arguments(0), "'", "''")
Set shell = CreateObject("WScript.Shell")
WScript.Quit shell.Run("powershell.exe -NoProfile -NonInteractive -WindowStyle Hidden -Command ""(New-Object System.Media.SoundPlayer '" & path & "').PlaySync()""", 0, True)
