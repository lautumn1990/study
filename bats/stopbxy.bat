@echo off
rem 结束北信源,可能需要管理员权限执行
taskkill /F /IM watchclient.exe /IM vrvedp_m.exe /IM vrvrf_c.exe /IM vrvrf_c64.exe /IM Vrvsafec.exe /IM EdpXcltSkin.exe /IM EdpXcltSvc.exe
pause