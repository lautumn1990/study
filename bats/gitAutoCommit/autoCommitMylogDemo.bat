@echo off
REM 需要两个参数, 一个是git目录所在位置, 一个是日志所在位置
set LOG_PATH=%~dp0gitAutoCommitMylog.log
call D:\projects\github\study\bats\gitAutoCommit\gitCommitAndPush.bat D:\projects\github\mylog %LOG_PATH%