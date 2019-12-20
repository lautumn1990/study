;快捷键, 最好以管理员权限运行
;功能键列表
;# Win (Windows logo key) 
;! Alt 
;^ Control 
;+ Shift 
;&  An ampersand may be used between any two keys or mouse buttons to combine them into a custom hotkey.  
;复制路径乱码问题, 应该使用U64版本, 不使用A32
;转义字符 { 需要用 {{}, }需要用{}}, 其他用`

#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.
#SingleInstance force  ; Ensures that only the last executed instance of script is running

VSCODE_EXIST := false ; 检测vscode是否存在

if (FileExist(A_APPDATA . "\..\Local\Programs\Microsoft VS Code\Code.exe")){
    VSCODE_EXIST := true
}

; windows + f1 first time press twice
#f1:: ;<-- hotkey help, 第一次启动需要加载Hotkey Help.ahk脚本, 所以需要按两次
    Run, Hotkey Help.ahk
return

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;全局常用快捷键;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;win+f 打开everything
#f:: ;<-- 打开everything
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

; ;win+w 打开total commander
; #w::
;     DetectHiddenWindows,on
;     IfWinNotExist ahk_class TTOTAL_CMD
;         run %A_AppData%\..\Local\TotalCMD64\Totalcmd64.exe
;     Else
;     IfWinNotActive ahk_class TTOTAL_CMD
;         WinActivate ahk_class TTOTAL_CMD
;     Else
;         WinMinimize ahk_class TTOTAL_CMD
; Return

;win+w 打开total commander
#w:: ;<-- 打开total commander
    windowMaxMinFun("ahk_class TTOTAL_CMD",A_AppData "\..\Local\TotalCMD64\Totalcmd64.exe")
return

;win+y 打开有道词典
#y:: ;<-- 打开有道词典
    windowMaxMinFun("ahk_class YodaoMainWndClass",A_AppData "\..\Local\youdao\dict\Application\YodaoDict.exe")
return

; 将已启动程序置为当前, 或者重新启动, 最小化
windowMaxMinFun(CL, CLPATH){
    DetectHiddenWindows,on
    if !WinExist(CL)
        ShellRun(CLPATH)
    else if !WinActive(CL)
        WinActivate %CL%
    else
        WinMinimize %CL%
    Return
}

:://cc:: ;<-- send A_AppDataCommon
    send, %A_AppDataCommon%
return

:://rrr:: ;<-- test sleep
    Reload
    Sleep 1000 ; 如果成功, 则 reload 会在 Sleep 期间关闭这个实例, 所以下面这行语句永远不会执行.
    MsgBox, 4,, The script could not be reloaded. Would you like to open it for editing?
    IfMsgBox, Yes, Edit
return

;将当前窗口的ahk_class复制到clipboard中
;#w::WinGetClass, Clipboard, A ; Will copy the ahk_class of the Active Window to clipboard

; 禁用ctrl+space
; ^space::return
; idea 禁用ctrl+space
#If (WinActive("ahk_exe idea64.exe") or WinActive("ahk_exe Code.exe"))
{
    ^space::  ;<-- idea 中禁用ctrl+space, idea 中的提示功能
        ControlSend, , ^{space}, A
    return 
    ^!M:: ;<-- idea 中禁用ctrl+alt+m, 还是作为方法抽取函数
        ControlSend, , ^!M, A
    return
}

; ; idea 中 三次ctrl为 有道翻译, 两次ctrl为run anything

#If (WinActive("ahk_exe idea64.exe"))
{
    $Ctrl:: ;<-- idea 中快速三次ctrl为有道翻译, 两次ctrl为run anything
        KeyWait Ctrl
        if (control_presses > 0) ; SetTimer already started, so we log the keypress instead.
        {
            ; DllCall("QueryPerformanceCounter", "Int64*", CounterAfter)          ; test click time
            ; MyToolTip((CounterAfter - CounterBefore) / freq * 1000 " ms", 3000)       ; test click time
            SetTimer, KeyControl, Off
            control_presses += 1
            MyToolTip(control_presses)
            SetTimer, KeyControl, -200
            return
        }
        control_presses := 1
        MyToolTip(control_presses)
        BlockInput On
        ; DllCall("QueryPerformanceFrequency", "Int64*", freq)                    ; test click time
        ; DllCall("QueryPerformanceCounter", "Int64*", CounterBefore)             ; test click time
        SetTimer, KeyControl, -200 ; press 3 times about 350ms ; Wait for more presses within a 400 millisecond window.
    return

    KeyControl:
        BlockInput Off
        if (control_presses = 1) ; The key was pressed once.
        {
            ; ControlSend, , {Ctrl}, A
        }
        else if (control_presses = 2) ; The key was pressed twice.
        {
            ControlSend, , {Ctrl 3}, A ; I don't know why need send three times in idea64.exe
        }
        else if (control_presses = 3)
        {
            ControlSend, , {Ctrl 2}, ahk_exe YoudaoDict.exe
        }
        ; tooltip %control_presses%
        ; SetTimer, RemoveToolTip, 1000
        control_presses := 0
    return
}

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;常用网址及命令;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;google.com
; :*://g::   
;     Run http://www.google.com
; return 

;;baidu.com
; :*://b::   
;     Run http://www.baidu.com
; return 

; :://e::   
;     Run C:\LS\Everything\Everything.exe   
; return 

; :*://c::
;     Run calc.exe
; return

; :*://cmd::
;     Run cmd.exe
; return

:*://ex::    ;<-- 打开explorer 
    Run explorer   
return  

;打开任务管理器   
:*://t::   ;<-- 打开任务管理器 
    if WinExist Windows 任务管理器   
        WinActivate   
    else   
        Run taskmgr.exe   
return   

;打开环境变量environment
;直接打开
:*://en:: ;<-- 打开环境变量environment
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
:*://sys:: ;<-- 打开系统属性
    Run control sysdm.cpl
return

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;常用网址搜索;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;google搜索
; !g::
;     Send ^c
;     Run http://www.google.com/search?q=%clipboard%
; return

;百度搜索
; !b::
;     Send ^c
;     Run http://www.baidu.com/s?wd=%clipboard%
; return

;用everything 搜索
!f:: ;<-- 用everything 搜索
    send ^c
    sleep 100
    run C:\LS\Everything\Everything.exe -s %clipboard%
return

;win键 + PrintScreen键关闭屏幕
#PrintScreen:: ;<-- 关闭屏幕
    KeyWait PrintScreen
    KeyWait LWin ;释放左Win键才激活下面的命令
    SendMessage,0x112,0xF170,2,,Program Manager ;关闭显示器。0x112:WM_SYSCOMMAND，0xF170:SC_MONITORPOWER。2：关闭，-1：开启显示器
Return

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;<Notepad>;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
#IfWinActive ahk_class Notepad
;ctrl+d复制一行
^d:: ;<-- 记事本中复制一行
    Send {Home}+{End}^c{End}{enter}^v
return
; ;剪切一行
; ^x::
; send {home}+{end}^x
; return
#IfWinActive

#IfWinActive ahk_class Chrome_WidgetWin_1
; ^+v::
;    send,IM-20160707-10724
; Return
#IfWinActive

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;常用缩写;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;工单号
::;im:: ;<-- 输入工单号
    SendInput,IM-20160707-10724
return
:*:;ii:: ;<-- 输入工单号并模拟登陆操作
    SendInput,IM-20160707-10724
    Click, 975, 310
    send,{Space}
    sleep,100
    Click, 351,600
return

;linux命令目录大小
:*:;du:: ;<-- linux命令目录大小
    SendInput,du -kh --max-depth=1
return
;mdm日志路径
:*:;mdmlog:: ;<-- mdm日志路径
    SendInput,/home/weblogic/bea/user_projects/domains/mdmdomain/logs
return

;mdm项目路径
:*:;mdm:: ;<-- mdm项目路径
    SendInput,/home/weblogic/bea/user_projects/domains/mdmdomain
return

;ecif项目路径
:*:;ecif:: ;<-- ecif项目路径
    SendInput,/home/middleware/weblogic1213/user_projects/domains/ecifdomain8001
return

;获取当前ip地址
:*:;ip:: ;<-- 获取当前ip地址
    send,%A_IPAddress1%
return

;输入自己的email
:*:;z@c:: ;<-- 输入公司邮箱
    SendInput,zhangqiu@chinasofti.com
return

;过滤进程号
:*:;gr:: ;<-- 过滤进程号
    SendInput,ps aux | grep --color=auto -i 
return

;加颜色
:*:;co:: ;<-- 加颜色
    SendInput,--color=auto
return

; windows 根据名称杀死进程
; :*:;tk:: ;<-- windows 根据名称杀死进程
;     SendInput,taskkill /F /IM ` 
; return

:*:;tk:: ;<-- windows 根据名称杀死进程
    SendInput,taskkill /F /IM ` 
return

; ;to 输入当前日期20190215 即 today日期
:*:;to:: ;<-- ;to 输入当前日期20190215 即 today日期
    FormatTime, now_date, %A_Now%, yyyyMMdd ;格式化当前时间
    now_date := "{# 3} " . now_date . "` ` {Enter 2}"
    sleep,30
    Send, %now_date% ;发送时间
return

; ;ta 输入markdown中的task前缀
:*:;ta:: ;<-- ;ta 输入markdown中的task前缀
    sleep,30
    send, - [ ]` ` 
return

; linux 根据名称杀死进程
:*:;ki:: ;<-- linux 根据名称杀死进程
    send,ps -ef | grep  | grep -v grep | awk `'{{}print $2`{}}`' | xargs kill -9
    send,{left 50}
return

;;; 数据库
:*:;se:: ;<-- 数据库查询
send,select `* from ` `;
Send {left}
return

; test in idea
:*:;te:: ;<-- test in idea
    send,@Test{Enter}public void testname(){{}{Enter}
    send,{up 1}
    send,^{right 2}
    send,^+{right 1}
return

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;capslock 全局生效;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; capslock + r刷新当前autohotkey脚本
CapsLock & r:: ;<-- 刷新当前autohotkey脚本
    sleep,100
    Reload
return

; capslock + x 剪切当前行
CapsLock & x:: ;<-- 剪切当前行
    send {home}+{end}^x
return

; capslock + c 复制当前行
CapsLock & c:: ;<-- 复制当前行
    send {home}+{end}^c
return

; capslock + d 复制并删帖行
CapsLock & d:: ;<-- 复制并删帖行
    send {home}+{end}^c
    send {end}{enter}^v
return

; capslock + w 取消所有窗口置顶, 防止出现多次置顶问题
CapsLock & w:: ;<-- 取消所有窗口置顶, 防止出现多次置顶问题
    WinGet, id, List,,, Program Manager
    Loop, %id%
    {
        this_id := id%A_Index%
        WinGet, Ex, ExStyle, ahk_id %this_id%
        if (Ex & 0x8){
            winset, AlwaysOnTop, off, ahk_id %this_id%
            WinMinimize, ahk_id %this_id%
        }
    }
    tooltip 取消所有窗口置顶
    SetTimer, RemoveToolTip, 1000
return

; 删除桌面上的ConEmu错误文件
CapsLock & t:: ;<-- 删除桌面上的ConEmu错误文件
    FileRemoveDir,%A_Desktop%\ConEmuTrap,1
return

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;常用键盘映射;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
#If !(WinActive("ahk_class TTOTAL_CMD") or WinActive("ahk_class SunAwtFrame"))
{
    ; alt+a 选择一行
    !a:: ;<-- 选择一行,并复制到剪贴板(不在total commander 和 idea 中生效 )
        Send {Home}
        Send +{End}
        Send ^c
    return

    ;上页翻页键映射
    !h::Send {PgUp} ;<-- 上翻页(不在total commander 和 idea 中生效 )
    !;::Send {PgDn} ;<-- 下翻页(不在total commander 和 idea 中生效 )
    ;HOME END键映射
    !u:: Send {Home} ;<-- home(不在total commander 和 idea 中生效 )
    !o:: Send {End} ;<--  end(不在total commander 和 idea 中生效 )
    ;Alt + jkli 实现对方向键的映射,写代码的时候灰常有用
    !j:: Send {left} ;<-- left(不在total commander 和 idea 中生效 )
    !l:: Send {right} ;<-- right(不在total commander 和 idea 中生效 )
    !i:: Send {up} ;<-- up(不在total commander 和 idea 中生效 )
    !k:: Send {down} ;<-- down(不在total commander 和 idea 中生效 )

    ; Delete Backspace的映射
    ; !f::Send {Backspace} ;<-- backspace(不在total commander 和 idea 中生效 )
    ; !d::Send {Delete} ;<-- delete(不在total commander 和 idea 中生效 )
    return
}
#If

;win+c复制全路径 在多窗口生效
#If WinActive("ahk_class CabinetWClass") or WinActive("ahk_class EVERYTHING") or WinActive("ahk_class WorkerW")
{
    #c::  ;<-- 复制文件名
        Clipboard = 
        Send,^c 
        ClipWait 
        path = %Clipboard% 
        Clipboard = %path% 
        Tooltip,%path% 
        Sleep,500 
        Tooltip 
    Return

    ; 复制路径名
    CapsLock & c:: ;<-- 复制文件路径
        Clipboard = 
        Send,^c 
        ClipWait
        filename = %Clipboard%
        StringGetPos, index, filename, \, R ; R表示从右侧开始查找, 默认是L从左侧开始查找
        if index >= 0
        {
            filename := SubStr(filename, 1,index+1)
            Clipboard = %filename%
        }
    return
}
#If

#IF WinActive("ahk_exe explorer.exe")
{
    F4::OpenWithF4("") ;<-- F4 1次 vscode 命令打开, F4 2次 idea 打开(explorer 中)
}

#If WinActive("ahk_class EVERYTHING")
{
    F4::OpenWithF4("ahk_class EVERYTHING") ;<-- F4 1次 everything默认命令打开, F4 2次 idea 打开(everything中)
}

#If WinActive("ahk_class TTOTAL_CMD")
{
    #c::Send,^3 ;<-- 复制文件名(total commander中)
    CapsLock & c::Send,^1 ; <-- 复制文件路径(total commander中)
    ; 定位到路径, 取消与clipcube的冲突
    ^+c::ControlSend, , ^+c, ahk_class TTOTAL_CMD ; <-- 取消与clipcube冲突(total commander中)
    F4::OpenWithF4("ahk_class TTOTAL_CMD") ;<-- F4 1次 TC默认命令打开, F4 2次 idea 打开(total commander中)
}

; f4启动当前文件, 一次为默认程序打开, 二次为idea打开, 多次需要再定义
OpenWithF4(CL){ ;cl为要发送的ahk_class名
    global key_f4_presses
    global key_f4_filename
    global key_f4_cl
     if (key_f4_presses > 0) ; SetTimer already started, so we log the keypress instead.
        {
            key_f4_presses += 1
            return
        }
        ; Otherwise, this is the first press of a new series. Set count to 1 and start
        ; the timer:
        key_f4_presses := 1 ; 初始化次数
        key_f4_filename := GetContent() ; 获取到的文件名
        key_f4_cl := CL ; 要发送f4命令的ahk_class名
        SetTimer, KeyF4, -400 ; Wait for more presses within a 400 millisecond window.
    return
}

KeyF4:
    ; MyToolTip(key_f4_presses)
    if (key_f4_presses = 1) ; The key was pressed once.
    {
        ; Run, m:\  ; Open a folder.
        ; run, "%A_APPDATA%\..\Local\Programs\Microsoft VS Code\Code.exe" "%filename%"
        if (key_f4_cl != ""){ ; 如果不为空, 发送F4命令到指定程序
            ControlSend, , {F4}, %key_f4_cl%
        } else if (VSCODE_EXIST){ ; 如果存在vscode则用vscode打开
            run, "%A_APPDATA%\..\Local\Programs\Microsoft VS Code\Code.exe" "%key_f4_filename%"
        } else { ; 用notepad打开
            MyToolTip("没有检测到vscode,用notepad打开")
            run, "notepad.exe" "%key_f4_filename%"
        }
        
    }
    else if (key_f4_presses = 2) ; The key was pressed twice.
    {
        ; Run, m:\multimedia  ; Open a different folder.
        run, "id.lnk" "%key_f4_filename%"
        WinActivate ahk_exe idea64.exe ; idea 默认后台打开
    }
    else if (key_f4_presses > 2) ; more times 
    {
        ; MsgBox, Three or more clicks detected.
        MsgBox , "double click f4 3 more times"
    }
    ; Regardless of which action above was triggered, reset the count to
    ; prepare for the next series of presses:
    key_f4_presses := 0
return

; eclipse 复制快捷键
; #IfWinActive ahk_class SWT_Window0
; ^c::Send,^c
; ^v::Send,%Clipboard%
; #IfWinActive

; ; 粘贴到前一个窗口中, ctrl+alt+c
; ^!c:: ;<-- 粘贴到另一个窗口中, ctrl+alt+c, 临时
;     KeyWait, Ctrl
;     KeyWait, Alt
;     Send,^c
;     send,!{Tab}
;     sleep,500
;     send,^v
; return

; 自定义暂存区
myClipboardSaved := ""

^!c:: ;<-- 复制到暂存的内容中
    ClipSaved := Clipboard
    Clipboard:=
    Send,^c 
    ClipWait 
    myClipboardSaved := Clipboard 
    Clipboard := ClipSaved 
    MyToolTip("以下内容复制到暂存区中 (ctrl+alt+v 粘贴):" 
    . "`n---------------------------------------------`n" 
    . myClipboardSaved . "`n---------------------------------------------`n",2000)

return

^!v:: ;<-- 粘贴暂存的内容
    if(myClipboardSaved = ""){
        MyToolTip("暂存区现在为空",1000)
        return
    }
    Send,%myClipboardSaved%
return

; total commander 快捷键
#IfWinActive ahk_class TTOTAL_CMD
#1::ControlSend, ,#1,ahk_class TTOTAL_CMD ;<-- total commander 忽略此全局按键
#2::ControlSend, ,#2,ahk_class TTOTAL_CMD ;<-- total commander 忽略此全局按键
#3::ControlSend, ,#3,ahk_class TTOTAL_CMD ;<-- total commander 忽略此全局按键
#4::ControlSend, ,#4,ahk_class TTOTAL_CMD ;<-- total commander 忽略此全局按键
#5::ControlSend, ,#5,ahk_class TTOTAL_CMD ;<-- total commander 忽略此全局按键
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

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;复制链接;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; ctrl+alt+[ (markdown)
; ctrl+alt+, (html)
; ctrl+alt+/ (bbcode)
; 用法, 先复制一个链接, 然后选中文字即可
^![::linker("markdown") ;<-- markdown 链接快捷键, 先复制一个链接, 然后选中文字即可
^!,::linker("html") ;<-- html 链接快捷键, 先复制一个链接, 然后选中文字即可
^!/::linker("bbcode") ;<-- bbcode 链接快捷键, 先复制一个链接, 然后选中文字即 

linker(link_type) {
    revert_clipboard := clipboardAll
    1st_clipboard    := trim(clipboard)
    clipboard        := ""
    send ^{c}
    clipwait, 0.3
    2nd_clipboard    := trim(clipboard)

    if regExMatch(1st_clipboard, "^(https?://|www\.)[a-zA-Z0-9\-\.]+\.[a-zA-Z]{2,3}(/\S*)?$")
         link := 1st_clipboard    ; clipboard is url
    else link := "link"

    if 2nd_clipboard is space     ; (if empty, space, tab or linefeed)
         text := "text"
    else text := 2nd_clipboard    ; text was highlighted

    if (link_type = "markdown")
        clipboard = [%text%](%link%)               ; [text](link)
    else if (link_type = "html")
        clipboard = <a href="%link%">%text%</a>    ; <a href="link">text</a>
    else if (link_type = "bbcode")
        clipboard = [url=%link%]%text%[/url]       ; [url=link]text[/url]
    send ^{v}

    if (text = "text")    ; if text wasnt highlighted, add a space at the end
        send % a_space "{left}"

    if (text = "text")    ; move caret to "link" or "text" and highlight it
        word := "text"
    else if (link = "link")
        word := "link"
    strReplace(clipboard, word, , count)
    if (word != "") and (count < 2)
        {
        sleep 200
        stringGetPos, pos, clipboard, % word
        send % "{left " (strLen(clipboard) - pos) "}+{right " strLen(word) "}"
        }

    sleep 100
    clipboard := revert_clipboard
}


/*
[script info]
version     = 2.1
description = generate a html/markdown/bbcode link from the clipboard or selected text
author      = davebrny
source      = https://gist.github.com/davebrny/b85e1470d2dd886053ef3415e7198508
*/

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;窗口操作;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

; 右键加滑轮 实现切换窗口功能
~RButton & WheelUp:: ShiftAltTab  ;<-- 切换窗口功能
~RButton & WheelDown:: AltTab ;<-- 切换窗口功能
; win键+右键 窗口置顶
~LWin & RButton:: ;<-- 窗口置顶
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
~LWin & WheelUp::  ;<-- 增加透明度
; 减少透明度
~LWin & WheelDown:: ;<-- 减少透明度
; 恢复透明度
~LWin & Mbutton:: ;<-- 恢复透明度
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
RemoveToolTip: ;<-- 清除窗口提示
    SetTimer, RemoveToolTip, Off
    ToolTip
return


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;以管理员权限运行autohotkey, 但是以普通身份打开其他程序;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; ShellRun("Taskmgr.exe") 即可

;If the script is not elevated, relaunch as administrator and kill current instance
if not A_IsAdmin
{
   Run *RunAs "%A_ScriptFullPath%"
   ExitApp
}

;Parameters for ShellRun
;1 application to launch
;2 command line parameters
;3 working directory for the new process
;4 "Verb" (For example, pass "RunAs" to run as administrator)
;5 Suggestion to the application about how to show its window - see the msdn link for possible values

; ShellRun("Taskmgr.exe")  ;Task manager
; ShellRun("Notepad", A_ScriptFullPath)  ;Open a file with notepad
; ShellRun("Notepad",,,"RunAs")  ;Open untitled notepad as administrator

/*
  ShellRun by Lexikos
    requires: AutoHotkey_L
    license: http://creativecommons.org/publicdomain/zero/1.0/

  Credit for explaining this method goes to BrandonLive:
  http://brandonlive.com/2008/04/27/getting-the-shell-to-run-an-application-for-you-part-2-how/
 
  Shell.ShellExecute(File [, Arguments, Directory, Operation, Show])
  http://msdn.microsoft.com/en-us/library/windows/desktop/gg537745
*/
ShellRun(prms*)
{
    shellWindows := ComObjCreate("{9BA05972-F6A8-11CF-A442-00A0C90A8F39}")
    
    desktop := shellWindows.Item(ComObj(19, 8)) ; VT_UI4, SCW_DESKTOP                
   
    ; Retrieve top-level browser object.
    if ptlb := ComObjQuery(desktop
        , "{4C96BE40-915C-11CF-99D3-00AA004AE837}"  ; SID_STopLevelBrowser
        , "{000214E2-0000-0000-C000-000000000046}") ; IID_IShellBrowser
    {
        ; IShellBrowser.QueryActiveShellView -> IShellView
        if DllCall(NumGet(NumGet(ptlb+0)+15*A_PtrSize), "ptr", ptlb, "ptr*", psv:=0) = 0
        {
            ; Define IID_IDispatch.
            VarSetCapacity(IID_IDispatch, 16)
            NumPut(0x46000000000000C0, NumPut(0x20400, IID_IDispatch, "int64"), "int64")
           
            ; IShellView.GetItemObject -> IDispatch (object which implements IShellFolderViewDual)
            DllCall(NumGet(NumGet(psv+0)+15*A_PtrSize), "ptr", psv
                , "uint", 0, "ptr", &IID_IDispatch, "ptr*", pdisp:=0)
           
            ; Get Shell object.
            shell := ComObj(9,pdisp,1).Application
           
            ; IShellDispatch2.ShellExecute
            shell.ShellExecute(prms*)
           
            ObjRelease(psv)
        }
        ObjRelease(ptlb)
    }
}

; clear tooltip in 1s
MyToolTip(text, time:=1000){
    ToolTip , %text%
    SetTimer, RemoveToolTip, %time%
}

GetContent(){
    ClipSaved := ClipboardAll
    Clipboard := ""
    Send ^c
    ClipWait
    content := Clipboard
    Clipboard := ClipSaved
    return content
}