@echo off
REM ���ݶ˿ںŻ�ȡ����
if "%1" == ""  goto:remind

REM FOR /F "usebackq tokens=2,5 delims= " %%i IN (`netstat -ano ^|find "%1"`) DO @tasklist /fi "pid eq %%j" | find "%%j"
FOR /F "usebackq tokens=2,5 delims= " %%i IN (`netstat -ano ^|find "%1"`) DO (
    @tasklist /fi "pid eq %%j" | find "%%j" | for /f "tokens=* delims= " %%f in ('more') do @echo %%f       %%i 
)
timeout 2 >nul
goto:eof

:remind
echo ������˿ں�
timeout 2 >nul