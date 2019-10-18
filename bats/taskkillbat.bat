@echo off
taskkill /F /IM %1.exe
If Not %ERRORLEVEL% EQU 0 (
    rem test have task name omit 
    tasklist | findstr /i %1% >nul
    if errorlevel 1 (
        echo not found %1.exe
    ) else (
        echo not found %1.exe, just found:
        tasklist | findstr /i %1%
    )
    Pause & Exit
)
timeout 2 >nul