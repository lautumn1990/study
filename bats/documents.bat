@echo off
set one=%1
if "%one%"=="" (goto opendir) else (goto openfilelnk)
:opendir
start "" "D:\documents\^_^汇总查看文档"
exit
:openfilelnk
start /d "C:\Users\lautumn1990\Desktop\桌面快捷方式\文档快捷方式" %one%
exit