@echo off
REM 根据端口号获取进程
if "%1" == ""  goto:remind

REM FOR /F "usebackq tokens=2,5 delims= " %%i IN (`netstat -ano ^|find "%1"`) DO @tasklist /fi "pid eq %%j" | find "%%j"
FOR /F "usebackq tokens=2,5 delims= " %%i IN (`netstat -ano ^|find "%1"`) DO (
    @tasklist /fi "pid eq %%j" | find "%%j" | for /f "tokens=* delims= " %%f in ('more') do @echo %%f       %%i 
)
timeout 2 >nul
goto:eof

:remind
echo 请输入端口号
timeout 2 >nul