@echo off   

::call:programStart "idea.exe" "C:\Users\Administrator.2017.V.2.12-007\Desktop\�����ݷ�ʽ\id.lnk"
call:programStart "chrome.exe" "C:\Users\Administrator.2017.V.2.12-007\Desktop\�����ݷ�ʽ\gc.lnk"
::call:programStart "navicat.exe" "C:\Users\Administrator.2017.V.2.12-007\Desktop\�����ݷ�ʽ\ms.lnk"
call:programStart "Code.exe" "C:\Users\Administrator.2017.V.2.12-007\Desktop\�����ݷ�ʽ\vs.lnk"
call:programStart "vmware.exe" "C:\Users\Administrator.2017.V.2.12-007\Desktop\�����ݷ�ʽ\vm.lnk"
call:programStart "Xshell.exe" "C:\Users\Administrator.2017.V.2.12-007\Desktop\�����ݷ�ʽ\xs.lnk"

:: ���رյ�ǰcmd
:: cmd.exe
:: pause
:: exit
goto:eof 

:programStart    
tasklist -v | findstr %1 > NUL
if ErrorLevel 1 (  
	echo %1 ���̲����ڣ���������  
	start "" %2 
) else (  
	echo %1 ������������ 
)    
goto:eof  



