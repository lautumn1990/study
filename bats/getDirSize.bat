@echo off
REM �����ӳٱ���, ���õ�ʱ����%var%��ȡ����, enabledelayedexpansion��ʱ����!var!��ȡ����
setlocal disabledelayedexpansion

rem ��ȡ����·��
set "folder=%~1"
  rem ���û������Ϊ��ǰ
  if not defined folder set "folder=%cd%"
  rem ����Ŀ¼
  for /d %%a in ("%folder%\*") do (
      set "size=0"
      rem /f ���Ӳ��� tokens �Էֺŷָ�, �ڼ���, %%b����������ʼ������ %%~fa����·�� %%~b ɾ������
      for /f "tokens=3,4" %%b in ('dir /-c /a /w /s "%%~fa\*" 2^>nul ^| findstr /b /c:"  "') do if "%%~c" neq "�����ֽ�" set "size=%%~b"
      setlocal enabledelayedexpansion
      call :GetUnit !size! unit
      call :ConvertBytes !size! !unit! newsize
      echo(%%~nxa - !newsize! !unit!
      endlocal
  )

endlocal
exit /b

rem ת����С
:ConvertBytes bytes unit ret
setlocal
if "%~2" EQU "KB" set val=/1024
if "%~2" EQU "MB" set val=/1024/1024
if "%~2" EQU "GB" set val=/1024/1024/1024
if "%~2" EQU "TB" set val=/1024/1024/1024/1024
> %temp%\tmp.vbs echo wsh.echo FormatNumber(eval(%~1%val%),1)
for /f "delims=" %%a in ( 
  'cscript //nologo %temp%\tmp.vbs' 
) do endlocal & set %~3=%%a
del %temp%\tmp.vbs
exit /b

rem ��ȡ��λ
:GetUnit bytes return
set byt=00000000000%1X
set TB=000000000001099511627776X
if %1 LEQ 1024 set "unit=Bytes"
if %1 GTR 1024   set "unit=KB"
if %1 GTR 1048576  set "unit=MB"
if %1 GTR 1073741824  set "unit=GB"
if %byt:~-14% GTR %TB:~-14% set "unit=TB"
endlocal & set %~2=%unit%
exit /b