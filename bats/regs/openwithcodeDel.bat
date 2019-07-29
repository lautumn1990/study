@Echo Off
set codepath=%LocalAppData%\Programs\Microsoft VS Code\Code.exe
cd %systemroot%\system32
call :IsAdmin

Reg.exe delete "HKCR\*\shell\openwithcode" /f
Exit

:IsAdmin
Reg.exe query "HKU\S-1-5-19\Environment"
If Not %ERRORLEVEL% EQU 0 (
 Cls & Echo You must have administrator rights to continue ... 
 Pause & Exit
)
Cls
goto:eof
