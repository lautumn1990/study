@echo off   

call:programStart "lync.exe" "C:\Users\lautumn1990\Desktop\�����ݷ�ʽ\ly.lnk"
call:programStart "Code.exe" "C:\Users\lautumn1990\Desktop\�����ݷ�ʽ\vs.lnk"
call:programStart "chrome.exe" "C:\Users\lautumn1990\Desktop\�����ݷ�ʽ\gc.lnk"
call:programStart "Toad.exe" "C:\Users\lautumn1990\Desktop\�����ݷ�ʽ\rsa.lnk"
call:programStart "idea.exe" "C:\Users\lautumn1990\Desktop\�����ݷ�ʽ\id.lnk"
REM call:programStart "navicat.exe" "C:\Users\lautumn1990\Desktop\�����ݷ�ʽ\ms.lnk"
REM call:programStart "vmware.exe" "C:\Users\lautumn1990\Desktop\�����ݷ�ʽ\vm.lnk"
REM call:programStart "Xshell.exe" "C:\Users\lautumn1990\Desktop\�����ݷ�ʽ\xs.lnk"
call:programStart "eclipse.exe" "C:\Users\lautumn1990\Desktop\�����ݷ�ʽ\rsa.lnk"
call:programStart "SogouExplorer.exe" "C:\Users\lautumn1990\Desktop\�����ݷ�ʽ\sg.lnk"

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



