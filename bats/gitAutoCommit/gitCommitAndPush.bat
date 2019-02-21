REM 依赖本目录下的 getTimestamp.bat 文件获取时间戳 , 时间戳 格式为yyyyMMddHHmmss
REM 脚本需要两个参数, 一个是git目录所在位置, 一个是日志所在位置
@echo off
@title bat 自动提交git

if "%2" == "" (
    exit
)

REM 获取当前脚本所在目录
REM echo %~dp0
REM 获取时间戳
call %~dp0getTimestamp.bat

set GIT_PATH=%1
set LOG_PATH=%2
set TIMESTAMP=%CURRENT_DATE_TIME_STAMP%

REM 定位到指定目录
cd /d %GIT_PATH%

echo [%TIMESTAMP%]>> %LOG_PATH%
git add .>> %LOG_PATH% 2>&1
git commit -m "%TIMESTAMP% auto commit">> %LOG_PATH% 2>&1
git push>> %LOG_PATH% 2>&1
echo.>> %LOG_PATH%
echo.>> %LOG_PATH%
