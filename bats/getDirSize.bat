@echo off
REM 禁用延迟变量, 禁用的时候用%var%获取变量, enabledelayedexpansion的时候用!var!获取变量
setlocal disabledelayedexpansion

rem 获取参数路径
set "folder=%~1"
  rem 如果没有则置为当前
  if not defined folder set "folder=%cd%"
  rem 遍历目录
  for /d %%a in ("%folder%\*") do (
      set "size=0"
      rem /f 增加参数 tokens 以分号分割, 第几个, %%b声明变量开始的名称 %%~fa完整路径 %%~b 删除引号
      for /f "tokens=3,4" %%b in ('dir /-c /a /w /s "%%~fa\*" 2^>nul ^| findstr /b /c:"  "') do if "%%~c" neq "可用字节" set "size=%%~b"
      setlocal enabledelayedexpansion
      call :GetUnit !size! unit
      call :ConvertBytes !size! !unit! newsize
      echo(%%~nxa - !newsize! !unit!
      endlocal
  )

endlocal
exit /b

rem 转换大小
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

rem 获取单位
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