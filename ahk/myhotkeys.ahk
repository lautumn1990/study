;快捷键, 最好以管理员权限运行
;功能键列表
;# Win (Windows logo key) 
;! Alt 
;^ Control 
;+ Shift 
;&  An ampersand may be used between any two keys or mouse buttons to combine them into a custom hotkey.  

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;全局常用快捷键;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;win+f 打开everything
#f::
DetectHiddenWindows,on
IfWinNotExist ahk_class EVERYTHING
run C:\LS\Everything\Everything.exe
Else
IfWinNotActive ahk_class EVERYTHING
WinActivate ahk_class EVERYTHING
Else
WinMinimize ahk_class EVERYTHING
Return

;将当前窗口的ahk_class复制到clipboard中
#w::WinGetClass, Clipboard, A ; Will copy the ahk_class of the Active Window to clipboard

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;常用网址及命令;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;google.com
::/g::   
Run http://www.google.com
return 

;;baidu.com
::/b::   
Run http://www.baidu.com
return 

::/e::   
Run C:\LS\Everything\Everything.exe   
return 

::/c::
Run calc.exe
return

::/cmd::
Run cmd.exe
return

::/ex::   
Run explorer   
return  

;打开任务管理器   
::/t::   
if WinExist Windows 任务管理器   
WinActivate   
else   
Run taskmgr.exe   
return   

;打开环境变量environment
;直接打开
::/en::
run rundll32.exe sysdm.cpl EditEnvironmentVariables
return
; 模拟按键
; ::/en::   
; Run SystemPropertiesAdvanced
; WinWaitActive,系统属性,,1        
; send {tab 3}
; send {enter}
; return   


;打开系统属性
::/sys::
Run control sysdm.cpl
return

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;常用网址搜索;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;google搜索
!g::
Send ^c
Run http://www.google.com/search?q=%clipboard%
return

;百度搜索
!b::
Send ^c
Run http://www.baidu.com/s?wd=%clipboard%
return

;选择一行
!a::
Send {Home}
Send +{End}
Send ^c
return

;win键 + PrintScreen键关闭屏幕
#PrintScreen::
KeyWait PrintScreen
KeyWait LWin ;释放左Win键才激活下面的命令
SendMessage,0x112,0xF170,2,,Program Manager ;关闭显示器。0x112:WM_SYSCOMMAND，0xF170:SC_MONITORPOWER。2：关闭，-1：开启显示器
Return

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;<Notepad>;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
#IfWinActive ahk_class Notepad
;ctrl+d复制一行
^d::
Send {Home}+{End}^c{End}{enter}^v
return
; ;剪切一行
; ^x::
; send {home}+{end}^x
; return
#IfWinActive

#IfWinActive ahk_class Chrome_WidgetWin_1
^+v::
   send,IM-20160707-10724
Return
#IfWinActive

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;常用缩写;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;工单号
::;im::IM-20160707-10724
;linux命令目录大小
::;du::du -kh --max-depth=1
;mdm日志路径
::;mdmlog::/home/weblogic/bea/user_projects/domains/mdmdomain/logs
;ecif日志路径

;获取当前ip地址
::;ip::
send,%A_IPAddress1%
return

;输入自己的email
::;m::zhangqiu@chinasofti.com

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;常用键盘映射;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;上页翻页键映射
!h::Send {PgUp}
!;::Send {PgDn}
;HOME END键映射
!u:: Send {Home}      ;
!o:: Send {End}   ;
;Alt + jkli 实现对方向键的映射,写代码的时候灰常有用
!j:: Send {left}
!l:: Send {right}
!i:: Send {up}
!k:: Send {down}

;Delete Backspace的映射
!f::Send {Backspace}
!d::Send {Delete}

;win+c复制全路径
#IfWinActive ahk_class CabinetWClass
#c:: 
Clipboard = 
Send,^c 
ClipWait 
path = %Clipboard% 
Clipboard = %path% 
Tooltip,%path% 
Sleep,100 
Tooltip 
Return
#IfWinActive
