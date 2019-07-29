@Echo Off
set codepath=%LocalAppData%\Programs\Microsoft VS Code\Code.exe
cd %systemroot%\system32
call :IsAdmin

Reg.exe add "HKCR\*\shell\openwithcode" /v "ProgrammaticAccessOnly" /t REG_SZ /d "Apartment" /f
Reg.exe add "HKCR\*\shell\openwithcode\command" /ve /t REG_SZ /d "%codepath% \"%%1\"" /f
Exit

:IsAdmin
Reg.exe query "HKU\S-1-5-19\Environment"
If Not %ERRORLEVEL% EQU 0 (
 Cls & Echo You must have administrator rights to continue ... 
 Pause & Exit
)
Cls
goto:eof
