@echo off
taskkill /F /IM %1%.exe
If Not %ERRORLEVEL% EQU 0 (
    echo not found %1%.exe , just found: 
    tasklist | findstr %1%
    Pause & Exit
)
timeout 2 >nul