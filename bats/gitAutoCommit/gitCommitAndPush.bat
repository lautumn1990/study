REM ������Ŀ¼�µ� getTimestamp.bat �ļ���ȡʱ��� , ʱ��� ��ʽΪyyyyMMddHHmmss
REM �ű���Ҫ��������, һ����gitĿ¼����λ��, һ������־����λ��
@echo off
@title bat �Զ��ύgit

if "%2" == "" (
    exit
)

REM ��ȡ��ǰ�ű�����Ŀ¼
REM echo %~dp0
REM ��ȡʱ���
call %~dp0getTimestamp.bat

set GIT_PATH=%1
set LOG_PATH=%2
set TIMESTAMP=%CURRENT_DATE_TIME_STAMP%

REM ��λ��ָ��Ŀ¼
cd /d %GIT_PATH%

echo [%TIMESTAMP%]>> %LOG_PATH%
git add .>> %LOG_PATH% 2>&1
git commit -m "%TIMESTAMP% auto commit">> %LOG_PATH% 2>&1
git push>> %LOG_PATH% 2>&1
echo.>> %LOG_PATH%
echo.>> %LOG_PATH%
