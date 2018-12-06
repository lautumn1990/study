;快捷键, 最好以管理员权限运行
;功能键列表
;# Win (Windows logo key) 
;! Alt 
;^ Control 
;+ Shift 
;&  An ampersand may be used between any two keys or mouse buttons to combine them into a custom hotkey.  

#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;全局常用快捷键;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;win+f 打开everything
#f::
    DetectHiddenWindows,on
    IfWinNotExist ahk_class EVERYTHING
        run C:\LS\Everything\Everything.exe
    Else
    IfWinNotActive ahk_class EVERYTHING
    {
        WinActivate ahk_class EVERYTHING
        WinWaitActive ahk_class EVERYTHING
        send,^f
    }
    Else
        WinMinimize ahk_class EVERYTHING
Return

;win+w 打开total commander
#w::
    DetectHiddenWindows,on
    IfWinNotExist ahk_class TTOTAL_CMD
        run %A_AppData%\..\Local\TotalCMD64\Totalcmd64.exe
    Else
    IfWinNotActive ahk_class TTOTAL_CMD
        WinActivate ahk_class TTOTAL_CMD
    Else
        WinMinimize ahk_class TTOTAL_CMD
Return

:://cc::
    send, %A_AppDataCommon%
return

:://rrr::
    Reload
    Sleep 1000 ; 如果成功, 则 reload 会在 Sleep 期间关闭这个实例, 所以下面这行语句永远不会执行.
    MsgBox, 4,, The script could not be reloaded. Would you like to open it for editing?
    IfMsgBox, Yes, Edit
return

;将当前窗口的ahk_class复制到clipboard中
;#w::WinGetClass, Clipboard, A ; Will copy the ahk_class of the Active Window to clipboard

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;常用网址及命令;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;google.com
:*://g::   
    Run http://www.google.com
return 

;;baidu.com
:*://b::   
    Run http://www.baidu.com
return 

:://e::   
    Run C:\LS\Everything\Everything.exe   
return 

:*://c::
    Run calc.exe
return

:*://cmd::
    Run cmd.exe
return

:*://ex::   
Run explorer   
return  

;打开任务管理器   
:*://t::   
    if WinExist Windows 任务管理器   
        WinActivate   
    else   
        Run taskmgr.exe   
return   

;打开环境变量environment
;直接打开
:*://en::
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
:*://sys::
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

;用everything 搜索
!f::
    send ^c
    sleep 100
    run C:\LS\Everything\Everything.exe -s %clipboard%
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
:*:;ii::
    SendInput,IM-20160707-10724
    Click, 975, 310
    send,{Space}
    sleep,100
    Click, 351,600
return

;linux命令目录大小
:*:;du::du -kh --max-depth=1
;mdm日志路径
:*:;mdmlog::/home/weblogic/bea/user_projects/domains/mdmdomain/logs

;mdm项目路径
:*:;mdm::/home/weblogic/bea/user_projects/domains/mdmdomain

;ecif项目路径
:*:;ecif::/home/middleware/weblogic1213/user_projects/domains/ecifdomain8001

;获取当前ip地址
:*:;ip::
    send,%A_IPAddress1%
return

;输入自己的email
:*:;z@c::zhangqiu@chinasofti.com

;过滤进程号
:*:;gr::ps aux | grep --color=auto -i 

;加颜色
:*:;co::--color=auto

; windows 根据名称杀死进程
:*:;tk::taskkill /F /IM ` 

; linux 根据名称杀死进程
:*:;ki::
    send,ps -ef | grep  | grep -v grep | awk `'{{}print $2`{}}`' | xargs kill -9
    send,{left 50}
return

;;; 数据库
:*:;se::
send,select `* from ` `;
Send {left}
return


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;capslock 全局生效;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;capslock + r刷新当前autohotkey脚本
CapsLock & r::
    sleep,100
    Reload
return

;capslock + x 剪切当前行
CapsLock & x::
    send {home}+{end}^x
return

;capslock + c 复制当前行
CapsLock & c::
    send {home}+{end}^c
return

;capslock + d 复制并删帖行
CapsLock & d::
    send {home}+{end}^c
    send {end}{enter}^v
return

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;常用键盘映射;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
If !(WinActive("ahk_class TTOTAL_CMD") or WinActive("ahk_class SunAwtFrame"))
{
    ;选择一行
    !a::
    Send {Home}
    Send +{End}
    Send ^c
    return

    ;上页翻页键映射
    !h::Send {PgUp}
    !;::Send {PgDn}
    ;HOME END键映射
    !u:: Send {Home}
    !o:: Send {End}
    ;Alt + jkli 实现对方向键的映射,写代码的时候灰常有用
    !j:: Send {left}
    !l:: Send {right}
    !i:: Send {up}
    !k:: Send {down}

    ; Delete Backspace的映射
    ; !f::Send {Backspace}
    ; !d::Send {Delete}
    return
}


;win+c复制全路径 在多窗口生效
If WinActive("ahk_class CabinetWClass") or WinActive("ahk_class EVERYTHING") or WinActive("ahk_class WorkerW")
{
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
}

; eclipse 复制快捷键
; #IfWinActive ahk_class SWT_Window0
; ^c::Send,^c
; ^v::Send,%Clipboard%
; #IfWinActive

; 粘贴到前一个窗口中, ctrl+alt+c
^!c::
Send,^c
send,!{Tab}
sleep,500
send,^v
return

; total commander 快捷键
#IfWinActive ahk_class TTOTAL_CMD
#1::ControlSend, ,#1,ahk_class TTOTAL_CMD
#2::ControlSend, ,#2,ahk_class TTOTAL_CMD
#3::ControlSend, ,#3,ahk_class TTOTAL_CMD
#4::ControlSend, ,#4,ahk_class TTOTAL_CMD
#5::ControlSend, ,#5,ahk_class TTOTAL_CMD
#IfWinActive

; word 快速复制, 临时
; #IfWinActive ahk_class OpusApp
; ^+w::
; Send,^c
; send,!{Tab}
; Sleep,700 
; send,^!v
; Sleep,700
; send,{Tab}{Tab}
; send,!{Tab}
; Sleep,500
; send,{Tab}{Tab}
; return
; #IfWinActive

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;窗口操作;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

; 右键加滑轮 实现切换窗口功能
~RButton & WheelUp:: ShiftAltTab
~RButton & WheelDown:: AltTab
; win键+右键 窗口置顶
~LWin & RButton::
    winset, AlwaysOnTop, Toggle, A
    WinGet, Ex, ExStyle, A
    if (Ex & 0x8)
        tooltip 窗口置顶
    Else
        tooltip 取消置顶
    SetTimer, RemoveToolTip, 1000
return

;win+滑轮切换透明度
; 增加透明度
~LWin & WheelUp::  
; 减少透明度
~LWin & WheelDown:: 
; 恢复透明度
~LWin & Mbutton:: 
    WinGet, Trans, Transparent,A  
    If (Trans="")  
        Trans=255  
    thiskey := A_ThisHotkey
    if RegExMatch(thiskey,"WheelUp")>0
    {
        Transparent_New:=Trans+20    ;◆透明度增加速度。  
        If (Transparent_New > 254)  
            Transparent_New =255  
    }
    else if RegExMatch(thiskey,"WheelDown")>0
    {
        Transparent_New:=Trans-20  ;◆透明度减少速度。  
        If (Transparent_New < 150)    ;◆最小透明度限制。  
            Transparent_New = 150  
    }
    else if RegExMatch(thiskey,"Mbutton")>0
    {
        Transparent_New = 255 
    }
    WinSet,Transparent,%Transparent_New%,A  
    tooltip %Transparent_New%  ;查看当前透明度（操作之后的）。  
    SetTimer, RemoveToolTip, 1000
return  

; 清除窗口提示
RemoveToolTip:
    SetTimer, RemoveToolTip, Off
    ToolTip
return