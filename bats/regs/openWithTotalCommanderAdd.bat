@Echo Off
set totalCmdPath=%LocalAppData%\TotalCMD64\Totalcmd64.exe
cd %systemroot%\system32
call :IsAdmin

REM ;添加tc到右键同时设为默认, 添加用资源管理器打开, 设为备选菜单
Reg.exe add "HKCR\Drive\shell" /ve /t REG_SZ /d "open" /f
Reg.exe add "HKCR\Drive\shell\open" /ve /t REG_SZ /d "用TC打开" /f
Reg.exe add "HKCR\Drive\shell\open" /v "Icon" /t REG_SZ /d "%totalCmdPath%" /f
Reg.exe add "HKCR\Drive\shell\open\command" /ve /t REG_SZ /d "%totalCmdPath% /O \"%%1\"" /f
Reg.exe add "HKCR\Drive\shell\openWithExplorer" /v "MultiSelectModel" /t REG_SZ /d "Document" /f
Reg.exe add "HKCR\Drive\shell\openWithExplorer" /v "Icon" /t REG_SZ /d "%%SystemRoot%%\System32\shell32.dll,3" /f
Reg.exe add "HKCR\Drive\shell\openWithExplorer" /ve /t REG_SZ /d "资源管理器打开 (&O)" /f
Reg.exe add "HKCR\Drive\shell\openWithExplorer\command" /ve /t REG_SZ /d "" /f
Reg.exe add "HKCR\Drive\shell\openWithExplorer\command" /v "DelegateExecute" /t REG_SZ /d "{11dbb47c-a525-400b-9e80-a54615a090c0}" /f
Reg.exe add "HKCR\Directory\shell" /ve /t REG_SZ /d "open" /f
Reg.exe add "HKCR\Directory\shell\open" /ve /t REG_SZ /d "用TC打开" /f
Reg.exe add "HKCR\Directory\shell\open" /v "Icon" /t REG_SZ /d "%totalCmdPath%" /f
Reg.exe add "HKCR\Directory\shell\open\command" /ve /t REG_SZ /d "%totalCmdPath% /O \"%%1\"" /f
Reg.exe add "HKCR\Directory\shell\openWithExplorer" /v "MultiSelectModel" /t REG_SZ /d "Document" /f
Reg.exe add "HKCR\Directory\shell\openWithExplorer" /v "Icon" /t REG_SZ /d "%%SystemRoot%%\System32\shell32.dll,3" /f
Reg.exe add "HKCR\Directory\shell\openWithExplorer" /ve /t REG_SZ /d "资源管理器打开 (&O)" /f
Reg.exe add "HKCR\Directory\shell\openWithExplorer\command" /ve /t REG_SZ /d "" /f
Reg.exe add "HKCR\Directory\shell\openWithExplorer\command" /v "DelegateExecute" /t REG_SZ /d "{11dbb47c-a525-400b-9e80-a54615a090c0}" /f
Exit

:IsAdmin
Reg.exe query "HKU\S-1-5-19\Environment"
If Not %ERRORLEVEL% EQU 0 (
 Cls & Echo You must have administrator rights to continue ... 
 Pause & Exit
)
Cls
goto:eof
