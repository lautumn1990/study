@echo off
REM 需要两个参数, 一个是git目录所在位置, 一个是日志所在位置
set GIT_PROJECT_PATH=D:\projects\github\mylog
set LOG_PATH=%~dp0gitAutoCommitMylog.log
REM 命令路径
set GIT_AUTOCOMMIT_CMD=D:\projects\github\study\bats\gitAutoCommit\gitCommitAndPush.bat

call %GIT_AUTOCOMMIT_CMD% %GIT_PROJECT_PATH% %LOG_PATH%