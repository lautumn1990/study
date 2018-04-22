@echo off   

call:programStart "lync.exe" "C:\Users\lautumn1990\Desktop\桌面快捷方式\ly.lnk"
call:programStart "Code.exe" "C:\Users\lautumn1990\Desktop\桌面快捷方式\vs.lnk"
call:programStart "chrome.exe" "C:\Users\lautumn1990\Desktop\桌面快捷方式\gc.lnk"
call:programStart "Toad.exe" "C:\Users\lautumn1990\Desktop\桌面快捷方式\rsa.lnk"
call:programStart "idea.exe" "C:\Users\lautumn1990\Desktop\桌面快捷方式\id.lnk"
REM call:programStart "navicat.exe" "C:\Users\lautumn1990\Desktop\桌面快捷方式\ms.lnk"
REM call:programStart "vmware.exe" "C:\Users\lautumn1990\Desktop\桌面快捷方式\vm.lnk"
REM call:programStart "Xshell.exe" "C:\Users\lautumn1990\Desktop\桌面快捷方式\xs.lnk"
call:programStart "eclipse.exe" "C:\Users\lautumn1990\Desktop\桌面快捷方式\rsa.lnk"
call:programStart "SogouExplorer.exe" "C:\Users\lautumn1990\Desktop\桌面快捷方式\sg.lnk"

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



