;��ݼ�, ����Թ���ԱȨ������
;���ܼ��б�
;# Win (Windows logo key) 
;! Alt 
;^ Control 
;+ Shift 
;&  An ampersand may be used between any two keys or mouse buttons to combine them into a custom hotkey.  

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

;win+w ��total commander
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
    Sleep 1000 ; ����ɹ�, �� reload ���� Sleep �ڼ�ر����ʵ��, �����������������Զ����ִ��.
    MsgBox, 4,, The script could not be reloaded. Would you like to open it for editing?
    IfMsgBox, Yes, Edit
return

;����ǰ���ڵ�ahk_class���Ƶ�clipboard��
;#w::WinGetClass, Clipboard, A ; Will copy the ahk_class of the Active Window to clipboard

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;������ַ������;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
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
!g::
    Send ^c
    Run http://www.google.com/search?q=%clipboard%
return

;�ٶ�����
!b::
    Send ^c
    Run http://www.baidu.com/s?wd=%clipboard%
return

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
^+v::
   send,IM-20160707-10724
Return
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


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;capslock ȫ����Ч;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;capslock + rˢ�µ�ǰautohotkey�ű�
CapsLock & r::
    sleep,100
    Reload
return

;capslock + x ���е�ǰ��
CapsLock & x::
    send {home}+{end}^x
return

;capslock + c ���Ƶ�ǰ��
CapsLock & c::
    send {home}+{end}^c
return

;capslock + d ���Ʋ�ɾ����
CapsLock & d::
    send {home}+{end}^c
    send {end}{enter}^v
return

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;���ü���ӳ��;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
If !(WinActive("ahk_class TTOTAL_CMD") or WinActive("ahk_class SunAwtFrame"))
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


;win+c����ȫ·�� �ڶര����Ч
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