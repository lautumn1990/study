;��ݼ�, ����Թ���ԱȨ������
;���ܼ��б�
;# Win (Windows logo key) 
;! Alt 
;^ Control 
;+ Shift 
;&  An ampersand may be used between any two keys or mouse buttons to combine them into a custom hotkey.  
;����·����������, Ӧ��ʹ��U64�汾, ��ʹ��A32
;ת���ַ� { ��Ҫ�� {{}, }��Ҫ��{}}, ������`

#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;ȫ�ֳ��ÿ�ݼ�;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;win+f ��everything
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

; ;win+w ��total commander
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

;win+w ��total commander
#w::
    windowMaxMinFun("ahk_class TTOTAL_CMD",A_AppData "\..\Local\TotalCMD64\Totalcmd64.exe")
return

;win+y ���е��ʵ�
#y::
    windowMaxMinFun("ahk_class YodaoMainWndClass",A_AppData "\..\Local\youdao\dict\Application\YodaoDict.exe")
return

; ��������������Ϊ��ǰ, ������������, ��С��
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

:://cc::
    send, %A_AppDataCommon%
return

:://rrr::
    Reload
    Sleep 1000 ; ����ɹ�, �� reload ���� Sleep �ڼ�ر����ʵ��, �����������������Զ����ִ��.
    MsgBox, 4,, The script could not be reloaded. Would you like to open it for editing?
    IfMsgBox, Yes, Edit
return

;����ǰ���ڵ�ahk_class���Ƶ�clipboard��
;#w::WinGetClass, Clipboard, A ; Will copy the ahk_class of the Active Window to clipboard

; ����ctrl+space
; ^space::return
; idea ����ctrl+space
#If (WinActive("ahk_exe idea64.exe") or WinActive("ahk_exe Code.exe"))
{
    ^space::ControlSend, , ^{space}, A
    ^!M::ControlSend, , ^!M, A
}
#If

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;������ַ������;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
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

:*://ex::   
Run explorer   
return  

;�����������   
:*://t::   
    if WinExist Windows ���������   
        WinActivate   
    else   
        Run taskmgr.exe   
return   

;�򿪻�������environment
;ֱ�Ӵ�
:*://en::
    run rundll32.exe sysdm.cpl EditEnvironmentVariables
return
; ģ�ⰴ��
; ::/en::   
; Run SystemPropertiesAdvanced
; WinWaitActive,ϵͳ����,,1        
; send {tab 3}
; send {enter}
; return   


;��ϵͳ����
:*://sys::
    Run control sysdm.cpl
return

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;������ַ����;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;google����
; !g::
;     Send ^c
;     Run http://www.google.com/search?q=%clipboard%
; return

;�ٶ�����
; !b::
;     Send ^c
;     Run http://www.baidu.com/s?wd=%clipboard%
; return

;��everything ����
!f::
    send ^c
    sleep 100
    run C:\LS\Everything\Everything.exe -s %clipboard%
return

;win�� + PrintScreen���ر���Ļ
#PrintScreen::
    KeyWait PrintScreen
    KeyWait LWin ;�ͷ���Win���ż������������
    SendMessage,0x112,0xF170,2,,Program Manager ;�ر���ʾ����0x112:WM_SYSCOMMAND��0xF170:SC_MONITORPOWER��2���رգ�-1��������ʾ��
Return

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;<Notepad>;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
#IfWinActive ahk_class Notepad
;ctrl+d����һ��
^d::
    Send {Home}+{End}^c{End}{enter}^v
return
; ;����һ��
; ^x::
; send {home}+{end}^x
; return
#IfWinActive

#IfWinActive ahk_class Chrome_WidgetWin_1
; ^+v::
;    send,IM-20160707-10724
; Return
#IfWinActive

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;������д;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;������
::;im::IM-20160707-10724
:*:;ii::
    SendInput,IM-20160707-10724
    Click, 975, 310
    send,{Space}
    sleep,100
    Click, 351,600
return

;linux����Ŀ¼��С
:*:;du::du -kh --max-depth=1
;mdm��־·��
:*:;mdmlog::/home/weblogic/bea/user_projects/domains/mdmdomain/logs

;mdm��Ŀ·��
:*:;mdm::/home/weblogic/bea/user_projects/domains/mdmdomain

;ecif��Ŀ·��
:*:;ecif::/home/middleware/weblogic1213/user_projects/domains/ecifdomain8001

;��ȡ��ǰip��ַ
:*:;ip::
    send,%A_IPAddress1%
return

;�����Լ���email
:*:;z@c::zhangqiu@chinasofti.com

;���˽��̺�
:*:;gr::ps aux | grep --color=auto -i 

;����ɫ
:*:;co::--color=auto

; windows ��������ɱ������
:*:;tk::taskkill /F /IM ` 

; ;to ���뵱ǰ����20190215 �� today����
:*:;to::
    FormatTime, now_date, %A_Now%, yyyyMMdd ;��ʽ����ǰʱ��
    now_date := "{# 3} " . now_date . "` ` {Enter 2}"
    sleep,30
    Send, %now_date% ;����ʱ��
return

; ;ta ����markdown�е�taskǰ׺
:*:;ta::
    sleep,30
    send, - [ ]` ` 
return

; linux ��������ɱ������
:*:;ki::
    send,ps -ef | grep  | grep -v grep | awk `'{{}print $2`{}}`' | xargs kill -9
    send,{left 50}
return

;;; ���ݿ�
:*:;se::
send,select `* from ` `;
Send {left}
return

; test in idea
:*:;te::
    send,@Test{Enter}public void testname(){{}{Enter}
    send,{up 1}
    send,^{right 2}
    send,^+{right 1}
return

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;capslock ȫ����Ч;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; capslock + rˢ�µ�ǰautohotkey�ű�
CapsLock & r::
    sleep,100
    Reload
return

; capslock + x ���е�ǰ��
CapsLock & x::
    send {home}+{end}^x
return

; capslock + c ���Ƶ�ǰ��
CapsLock & c::
    send {home}+{end}^c
return

; capslock + d ���Ʋ�ɾ����
CapsLock & d::
    send {home}+{end}^c
    send {end}{enter}^v
return

; capslock + w ȡ�����д����ö�, ��ֹ���ֶ���ö�����
CapsLock & w::
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
    tooltip ȡ�����д����ö�
    SetTimer, RemoveToolTip, 1000
return

; ɾ�������ϵ�ConEmu�����ļ�
CapsLock & t::
    FileRemoveDir,%A_Desktop%\ConEmuTrap,1
return

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;���ü���ӳ��;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
#If !(WinActive("ahk_class TTOTAL_CMD") or WinActive("ahk_class SunAwtFrame"))
{
    ;ѡ��һ��
    !a::
    Send {Home}
    Send +{End}
    Send ^c
    return

    ;��ҳ��ҳ��ӳ��
    !h::Send {PgUp}
    !;::Send {PgDn}
    ;HOME END��ӳ��
    !u:: Send {Home}
    !o:: Send {End}
    ;Alt + jkli ʵ�ֶԷ������ӳ��,д�����ʱ��ҳ�����
    !j:: Send {left}
    !l:: Send {right}
    !i:: Send {up}
    !k:: Send {down}

    ; Delete Backspace��ӳ��
    ; !f::Send {Backspace}
    ; !d::Send {Delete}
    return
}
#If

;win+c����ȫ·�� �ڶര����Ч
#If WinActive("ahk_class CabinetWClass") or WinActive("ahk_class EVERYTHING") or WinActive("ahk_class WorkerW")
{
    #c:: 
        Clipboard = 
        Send,^c 
        ClipWait 
        path = %Clipboard% 
        Clipboard = %path% 
        Tooltip,%path% 
        Sleep,500 
        Tooltip 
    Return

    ; ����·����
    CapsLock & c::
        Clipboard = 
        Send,^c 
        ClipWait
        filename = %Clipboard%
        StringGetPos, index, filename, \, R ; R��ʾ���Ҳ࿪ʼ����, Ĭ����L����࿪ʼ����
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
    F4::
        ClipSaved := ClipboardAll
        Clipboard := ""
        Send ^c
        ClipWait
        filename := Clipboard
        Clipboard := ClipSaved
        run, "%A_APPDATA%\..\Local\Programs\Microsoft VS Code\Code.exe" "%filename%"
    return
}

#If WinActive("ahk_class TTOTAL_CMD")
{
    #c::Send,^3
    CapsLock & c::Send,^1
}

; eclipse ���ƿ�ݼ�
; #IfWinActive ahk_class SWT_Window0
; ^c::Send,^c
; ^v::Send,%Clipboard%
; #IfWinActive

; ճ����ǰһ��������, ctrl+alt+c
^!c::
Send,^c
send,!{Tab}
sleep,500
send,^v
return

; total commander ��ݼ�
#IfWinActive ahk_class TTOTAL_CMD
#1::ControlSend, ,#1,ahk_class TTOTAL_CMD
#2::ControlSend, ,#2,ahk_class TTOTAL_CMD
#3::ControlSend, ,#3,ahk_class TTOTAL_CMD
#4::ControlSend, ,#4,ahk_class TTOTAL_CMD
#5::ControlSend, ,#5,ahk_class TTOTAL_CMD
#IfWinActive

; word ���ٸ���, ��ʱ
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

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;���ڲ���;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

; �Ҽ��ӻ��� ʵ���л����ڹ���
~RButton & WheelUp:: ShiftAltTab
~RButton & WheelDown:: AltTab
; win��+�Ҽ� �����ö�
~LWin & RButton::
    winset, AlwaysOnTop, Toggle, A
    WinGet, Ex, ExStyle, A
    if (Ex & 0x8)
        tooltip �����ö�
    Else
        tooltip ȡ���ö�
    SetTimer, RemoveToolTip, 1000
return

;win+�����л�͸����
; ����͸����
~LWin & WheelUp::  
; ����͸����
~LWin & WheelDown:: 
; �ָ�͸����
~LWin & Mbutton:: 
    WinGet, Trans, Transparent,A  
    If (Trans="")  
        Trans=255  
    thiskey := A_ThisHotkey
    if RegExMatch(thiskey,"WheelUp")>0
    {
        Transparent_New:=Trans+20    ;��͸���������ٶȡ�  
        If (Transparent_New > 254)  
            Transparent_New =255  
    }
    else if RegExMatch(thiskey,"WheelDown")>0
    {
        Transparent_New:=Trans-20  ;��͸���ȼ����ٶȡ�  
        If (Transparent_New < 150)    ;����С͸�������ơ�  
            Transparent_New = 150  
    }
    else if RegExMatch(thiskey,"Mbutton")>0
    {
        Transparent_New = 255 
    }
    WinSet,Transparent,%Transparent_New%,A  
    tooltip %Transparent_New%  ;�鿴��ǰ͸���ȣ�����֮��ģ���  
    SetTimer, RemoveToolTip, 1000
return  

; ���������ʾ
RemoveToolTip:
    SetTimer, RemoveToolTip, Off
    ToolTip
return


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;�Թ���ԱȨ������autohotkey, ��������ͨ��ݴ���������;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; ShellRun("Taskmgr.exe") ����

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