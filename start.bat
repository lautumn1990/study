@echo off   

::call:programStart "idea.exe" "C:\Users\Administrator.2017.V.2.12-007\Desktop\桌面快捷方式\id.lnk"
call:programStart "chrome.exe" "C:\Users\Administrator.2017.V.2.12-007\Desktop\桌面快捷方式\gc.lnk"
::call:programStart "navicat.exe" "C:\Users\Administrator.2017.V.2.12-007\Desktop\桌面快捷方式\ms.lnk"
call:programStart "Code.exe" "C:\Users\Administrator.2017.V.2.12-007\Desktop\桌面快捷方式\vs.lnk"
call:programStart "vmware.exe" "C:\Users\Administrator.2017.V.2.12-007\Desktop\桌面快捷方式\vm.lnk"
call:programStart "Xshell.exe" "C:\Users\Administrator.2017.V.2.12-007\Desktop\桌面快捷方式\xs.lnk"

:: 不关闭当前cmd
:: cmd.exe
:: pause
:: exit
goto:eof 

:programStart    
tasklist -v | findstr %1 > NUL
if ErrorLevel 1 (  
	echo %1 进程不存在，正在启动  
	start "" %2 
) else (  
	echo %1 进程已在运行 
)    
goto:eof  



