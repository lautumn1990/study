@echo off
@title bat 自动提交git

set LOG_PATH=C:\Users\lautumn\Desktop\log.txt
set GIT_PATH=C:\Users\lautumn\Desktop\gittest
set TIMESTAMP=%date:~0,4%%date:~5,2%%date:~8,2%%time:~0,2%%time:~3,2%%time:~6,2%

REM 定位到指定目录
cd /d %GIT_PATH%

echo [%TIMESTAMP%]>> %LOG_PATH%
git add .>> %LOG_PATH% 2>&1
git commit -m %TIMESTAMP%>> %LOG_PATH% 2>&1
git push>> %LOG_PATH% 2>&1
echo.>> %LOG_PATH%
echo.>> %LOG_PATH%