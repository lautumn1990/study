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
#SingleInstance force  ; Ensures that only the last executed instance of script is running

VSCODE_EXIST := false ; ���vscode�Ƿ����

if (FileExist(A_APPDATA . "\..\Local\Programs\Microsoft VS Code\Code.exe")){
    VSCODE_EXIST := true
}

; windows + f1 first time press twice
#f1:: ;<-- hotkey help, ��һ��������Ҫ����Hotkey Help.ahk�ű�, ������Ҫ������
    Run, Hotkey Help.ahk
return

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;ȫ�ֳ��ÿ�ݼ�;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;win+f ��everything
#f:: ;<-- ��everything
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
#w:: ;<-- ��total commander
    windowMaxMinFun("ahk_class TTOTAL_CMD",A_AppData "\..\Local\TotalCMD64\Totalcmd64.exe")
return

;win+y ���е��ʵ�
#y:: ;<-- ���е��ʵ�
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

:://cc:: ;<-- send A_AppDataCommon
    send, %A_AppDataCommon%
return

:://rrr:: ;<-- test sleep
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
    ^space::  ;<-- idea �н���ctrl+space, idea �е���ʾ����
        ControlSend, , ^{space}, A
    return 
    ^!M:: ;<-- idea �н���ctrl+alt+m, ������Ϊ������ȡ����
        ControlSend, , ^!M, A
    return
}

; ; idea �� ����ctrlΪ �е�����, ����ctrlΪrun anything

#If (WinActive("ahk_exe idea64.exe"))
{
    $Ctrl:: ;<-- idea �п�������ctrlΪ�е�����, ����ctrlΪrun anything
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

:*://ex::    ;<-- ��explorer 
    Run explorer   
return  

;�����������   
:*://t::   ;<-- ����������� 
    if WinExist Windows ���������   
        WinActivate   
    else   
        Run taskmgr.exe   
return   

;�򿪻�������environment
;ֱ�Ӵ�
:*://en:: ;<-- �򿪻�������environment
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
:*://sys:: ;<-- ��ϵͳ����
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
!f:: ;<-- ��everything ����
    send ^c
    sleep 100
    run C:\LS\Everything\Everything.exe -s %clipboard%
return

;win�� + PrintScreen���ر���Ļ
#PrintScreen:: ;<-- �ر���Ļ
    KeyWait PrintScreen
    KeyWait LWin ;�ͷ���Win���ż������������
    SendMessage,0x112,0xF170,2,,Program Manager ;�ر���ʾ����0x112:WM_SYSCOMMAND��0xF170:SC_MONITORPOWER��2���رգ�-1��������ʾ��
Return

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;<Notepad>;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
#IfWinActive ahk_class Notepad
;ctrl+d����һ��
^d:: ;<-- ���±��и���һ��
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
::;im:: ;<-- ���빤����
    SendInput,IM-20160707-10724
return
:*:;ii:: ;<-- ���빤���Ų�ģ���½����
    SendInput,IM-20160707-10724
    Click, 975, 310
    send,{Space}
    sleep,100
    Click, 351,600
return

;linux����Ŀ¼��С
:*:;du:: ;<-- linux����Ŀ¼��С
    SendInput,du -kh --max-depth=1
return
;mdm��־·��
:*:;mdmlog:: ;<-- mdm��־·��
    SendInput,/home/weblogic/bea/user_projects/domains/mdmdomain/logs
return

;mdm��Ŀ·��
:*:;mdm:: ;<-- mdm��Ŀ·��
    SendInput,/home/weblogic/bea/user_projects/domains/mdmdomain
return

;ecif��Ŀ·��
:*:;ecif:: ;<-- ecif��Ŀ·��
    SendInput,/home/middleware/weblogic1213/user_projects/domains/ecifdomain8001
return

;��ȡ��ǰip��ַ
:*:;ip:: ;<-- ��ȡ��ǰip��ַ
    send,%A_IPAddress1%
return

;�����Լ���email
:*:;z@c:: ;<-- ���빫˾����
    SendInput,zhangqiu@chinasofti.com
return

;���˽��̺�
:*:;gr:: ;<-- ���˽��̺�
    SendInput,ps aux | grep --color=auto -i 
return

;����ɫ
:*:;co:: ;<-- ����ɫ
    SendInput,--color=auto
return

; windows ��������ɱ������
; :*:;tk:: ;<-- windows ��������ɱ������
;     SendInput,taskkill /F /IM ` 
; return

:*:;tk:: ;<-- windows ��������ɱ������
    SendInput,taskkill /F /IM ` 
return

; ;to ���뵱ǰ����20190215 �� today����
:*:;to:: ;<-- ;to ���뵱ǰ����20190215 �� today����
    FormatTime, now_date, %A_Now%, yyyyMMdd ;��ʽ����ǰʱ��
    now_date := "{# 3} " . now_date . "` ` {Enter 2}"
    sleep,30
    Send, %now_date% ;����ʱ��
return

; ;ta ����markdown�е�taskǰ׺
:*:;ta:: ;<-- ;ta ����markdown�е�taskǰ׺
    sleep,30
    send, - [ ]` ` 
return

; linux ��������ɱ������
:*:;ki:: ;<-- linux ��������ɱ������
    send,ps -ef | grep  | grep -v grep | awk `'{{}print $2`{}}`' | xargs kill -9
    send,{left 50}
return

;;; ���ݿ�
:*:;se:: ;<-- ���ݿ��ѯ
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

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;capslock ȫ����Ч;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; capslock + rˢ�µ�ǰautohotkey�ű�
CapsLock & r:: ;<-- ˢ�µ�ǰautohotkey�ű�
    sleep,100
    Reload
return

; capslock + x ���е�ǰ��
CapsLock & x:: ;<-- ���е�ǰ��
    send {home}+{end}^x
return

; capslock + c ���Ƶ�ǰ��
CapsLock & c:: ;<-- ���Ƶ�ǰ��
    send {home}+{end}^c
return

; capslock + d ���Ʋ�ɾ����
CapsLock & d:: ;<-- ���Ʋ�ɾ����
    send {home}+{end}^c
    send {end}{enter}^v
return

; capslock + w ȡ�����д����ö�, ��ֹ���ֶ���ö�����
CapsLock & w:: ;<-- ȡ�����д����ö�, ��ֹ���ֶ���ö�����
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
CapsLock & t:: ;<-- ɾ�������ϵ�ConEmu�����ļ�
    FileRemoveDir,%A_Desktop%\ConEmuTrap,1
return

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;���ü���ӳ��;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
#If !(WinActive("ahk_class TTOTAL_CMD") or WinActive("ahk_class SunAwtFrame"))
{
    ; alt+a ѡ��һ��
    !a:: ;<-- ѡ��һ��,�����Ƶ�������(����total commander �� idea ����Ч )
        Send {Home}
        Send +{End}
        Send ^c
    return

    ;��ҳ��ҳ��ӳ��
    !h::Send {PgUp} ;<-- �Ϸ�ҳ(����total commander �� idea ����Ч )
    !;::Send {PgDn} ;<-- �·�ҳ(����total commander �� idea ����Ч )
    ;HOME END��ӳ��
    !u:: Send {Home} ;<-- home(����total commander �� idea ����Ч )
    !o:: Send {End} ;<--  end(����total commander �� idea ����Ч )
    ;Alt + jkli ʵ�ֶԷ������ӳ��,д�����ʱ��ҳ�����
    !j:: Send {left} ;<-- left(����total commander �� idea ����Ч )
    !l:: Send {right} ;<-- right(����total commander �� idea ����Ч )
    !i:: Send {up} ;<-- up(����total commander �� idea ����Ч )
    !k:: Send {down} ;<-- down(����total commander �� idea ����Ч )

    ; Delete Backspace��ӳ��
    ; !f::Send {Backspace} ;<-- backspace(����total commander �� idea ����Ч )
    ; !d::Send {Delete} ;<-- delete(����total commander �� idea ����Ч )
    return
}
#If

;win+c����ȫ·�� �ڶര����Ч
#If WinActive("ahk_class CabinetWClass") or WinActive("ahk_class EVERYTHING") or WinActive("ahk_class WorkerW")
{
    #c::  ;<-- �����ļ���
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
    CapsLock & c:: ;<-- �����ļ�·��
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
    F4::OpenWithF4("") ;<-- F4 1�� vscode �����, F4 2�� idea ��(explorer ��)
}

#If WinActive("ahk_class EVERYTHING")
{
    F4::OpenWithF4("ahk_class EVERYTHING") ;<-- F4 1�� everythingĬ�������, F4 2�� idea ��(everything��)
}

#If WinActive("ahk_class TTOTAL_CMD")
{
    #c::Send,^3 ;<-- �����ļ���(total commander��)
    CapsLock & c::Send,^1 ; <-- �����ļ�·��(total commander��)
    ; ��λ��·��, ȡ����clipcube�ĳ�ͻ
    ^+c::ControlSend, , ^+c, ahk_class TTOTAL_CMD ; <-- ȡ����clipcube��ͻ(total commander��)
    F4::OpenWithF4("ahk_class TTOTAL_CMD") ;<-- F4 1�� TCĬ�������, F4 2�� idea ��(total commander��)
}

; f4������ǰ�ļ�, һ��ΪĬ�ϳ����, ����Ϊidea��, �����Ҫ�ٶ���
OpenWithF4(CL){ ;clΪҪ���͵�ahk_class��
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
        key_f4_presses := 1 ; ��ʼ������
        key_f4_filename := GetContent() ; ��ȡ�����ļ���
        key_f4_cl := CL ; Ҫ����f4�����ahk_class��
        SetTimer, KeyF4, -400 ; Wait for more presses within a 400 millisecond window.
    return
}

KeyF4:
    ; MyToolTip(key_f4_presses)
    if (key_f4_presses = 1) ; The key was pressed once.
    {
        ; Run, m:\  ; Open a folder.
        ; run, "%A_APPDATA%\..\Local\Programs\Microsoft VS Code\Code.exe" "%filename%"
        if (key_f4_cl != ""){ ; �����Ϊ��, ����F4���ָ������
            ControlSend, , {F4}, %key_f4_cl%
        } else if (VSCODE_EXIST){ ; �������vscode����vscode��
            run, "%A_APPDATA%\..\Local\Programs\Microsoft VS Code\Code.exe" "%key_f4_filename%"
        } else { ; ��notepad��
            MyToolTip("û�м�⵽vscode,��notepad��")
            run, "notepad.exe" "%key_f4_filename%"
        }
        
    }
    else if (key_f4_presses = 2) ; The key was pressed twice.
    {
        ; Run, m:\multimedia  ; Open a different folder.
        run, "id.lnk" "%key_f4_filename%"
        WinActivate ahk_exe idea64.exe ; idea Ĭ�Ϻ�̨��
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

; eclipse ���ƿ�ݼ�
; #IfWinActive ahk_class SWT_Window0
; ^c::Send,^c
; ^v::Send,%Clipboard%
; #IfWinActive

; ; ճ����ǰһ��������, ctrl+alt+c
; ^!c:: ;<-- ճ������һ��������, ctrl+alt+c, ��ʱ
;     KeyWait, Ctrl
;     KeyWait, Alt
;     Send,^c
;     send,!{Tab}
;     sleep,500
;     send,^v
; return

; �Զ����ݴ���
myClipboardSaved := ""

^!c:: ;<-- ���Ƶ��ݴ��������
    ClipSaved := Clipboard
    Clipboard:=
    Send,^c 
    ClipWait 
    myClipboardSaved := Clipboard 
    Clipboard := ClipSaved 
    MyToolTip("�������ݸ��Ƶ��ݴ����� (ctrl+alt+v ճ��):" 
    . "`n---------------------------------------------`n" 
    . myClipboardSaved . "`n---------------------------------------------`n",2000)

return

^!v:: ;<-- ճ���ݴ������
    if(myClipboardSaved = ""){
        MyToolTip("�ݴ�������Ϊ��",1000)
        return
    }
    Send,%myClipboardSaved%
return

; total commander ��ݼ�
#IfWinActive ahk_class TTOTAL_CMD
#1::ControlSend, ,#1,ahk_class TTOTAL_CMD ;<-- total commander ���Դ�ȫ�ְ���
#2::ControlSend, ,#2,ahk_class TTOTAL_CMD ;<-- total commander ���Դ�ȫ�ְ���
#3::ControlSend, ,#3,ahk_class TTOTAL_CMD ;<-- total commander ���Դ�ȫ�ְ���
#4::ControlSend, ,#4,ahk_class TTOTAL_CMD ;<-- total commander ���Դ�ȫ�ְ���
#5::ControlSend, ,#5,ahk_class TTOTAL_CMD ;<-- total commander ���Դ�ȫ�ְ���
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

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;��������;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; ctrl+alt+[ (markdown)
; ctrl+alt+, (html)
; ctrl+alt+/ (bbcode)
; �÷�, �ȸ���һ������, Ȼ��ѡ�����ּ���
^![::linker("markdown") ;<-- markdown ���ӿ�ݼ�, �ȸ���һ������, Ȼ��ѡ�����ּ���
^!,::linker("html") ;<-- html ���ӿ�ݼ�, �ȸ���һ������, Ȼ��ѡ�����ּ���
^!/::linker("bbcode") ;<-- bbcode ���ӿ�ݼ�, �ȸ���һ������, Ȼ��ѡ�����ּ� 

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

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;���ڲ���;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

; �Ҽ��ӻ��� ʵ���л����ڹ���
~RButton & WheelUp:: ShiftAltTab  ;<-- �л����ڹ���
~RButton & WheelDown:: AltTab ;<-- �л����ڹ���
; win��+�Ҽ� �����ö�
~LWin & RButton:: ;<-- �����ö�
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
~LWin & WheelUp::  ;<-- ����͸����
; ����͸����
~LWin & WheelDown:: ;<-- ����͸����
; �ָ�͸����
~LWin & Mbutton:: ;<-- �ָ�͸����
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
RemoveToolTip: ;<-- ���������ʾ
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