@echo off
set one=%1
if "%one%"=="" (goto opendir) else (goto openfilelnk)
:opendir
start "" "D:\documents\^_^���ܲ鿴�ĵ�"
exit
:openfilelnk
start /d "C:\Users\lautumn1990\Desktop\�����ݷ�ʽ\�ĵ���ݷ�ʽ" %one%
exit