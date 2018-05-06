@echo off
set str=%1
if "%str%"=="o" (goto open
) else (
goto close
)
rem 开启代理
:open
echo 正在设置代理服务器……
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Internet Settings" /v ProxyEnable /t REG_DWORD /d 1 /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Internet Settings" /v ProxyServer /d "proxy.piccnet.com.cn:3128" /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Internet Settings" /v ProxyOverride /t REG_SZ /d "10.*;11.*;4a.*;sso.*;proxy.piccnet.com.cn;172.*;oa.*;web.*;mail.picc.com.cn;tfs.piccnet.com.cn;tfssp.piccnet.com.cn;*.quest.com;*.toadsoft.com;sso.piccnet.com.cn;10.1.244.95;<local>" /f
pause
rem 禁用代理
goto:eof
:close
echo 取消设置代理服务器……
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Internet Settings" /v ProxyEnable /t REG_DWORD /d 0 /f
reg delete "HKCU\Software\Microsoft\Windows\CurrentVersion\Internet Settings" /v ProxyServer /f
reg delete "HKCU\Software\Microsoft\Windows\CurrentVersion\Internet Settings" /v ProxyOverride /f
pause
goto:eof

pause