@Echo Off
cd %systemroot%\system32
call :IsAdmin

Reg.exe add "HKCR\Drive\shell" /ve /t REG_SZ /d "none" /f
Reg.exe delete "HKCR\Drive\shell\open" /f
Reg.exe delete "HKCR\Drive\shell\openWithExplorer" /f
Reg.exe add "HKCR\Directory\shell" /ve /t REG_SZ /d "none" /f
Reg.exe delete "HKCR\Directory\shell\open" /f
Reg.exe delete "HKCR\Directory\shell\openWithExplorer" /f
Exit

:IsAdmin
Reg.exe query "HKU\S-1-5-19\Environment"
If Not %ERRORLEVEL% EQU 0 (
 Cls & Echo You must have administrator rights to continue ... 
 Pause & Exit
)
Cls
goto:eof
