;��ݼ�, ����Թ���ԱȨ������
;���ܼ��б�
;# Win (Windows logo key) 
;! Alt 
;^ Control 
;+ Shift 
;&  An ampersand may be used between any two keys or mouse buttons to combine them into a custom hotkey.  

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;ȫ�ֳ��ÿ�ݼ�;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;win+f ��everything
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

;����ǰ���ڵ�ahk_class���Ƶ�clipboard��
#w::WinGetClass, Clipboard, A ; Will copy the ahk_class of the Active Window to clipboard

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;������ַ������;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
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

;�����������   
::/t::   
if WinExist Windows ���������   
WinActivate   
else   
Run taskmgr.exe   
return   

;�򿪻�������environment
;ֱ�Ӵ�
::/en::
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
::/sys::
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

;ѡ��һ��
!a::
Send {Home}
Send +{End}
Send ^c
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
;linux����Ŀ¼��С
::;du::du -kh --max-depth=1
;mdm��־·��
::;mdmlog::/home/weblogic/bea/user_projects/domains/mdmdomain/logs
;ecif��־·��

;��ȡ��ǰip��ַ
::;ip::
send,%A_IPAddress1%
return

;�����Լ���email
::;m::zhangqiu@chinasofti.com

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;���ü���ӳ��;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;��ҳ��ҳ��ӳ��
!h::Send {PgUp}
!;::Send {PgDn}
;HOME END��ӳ��
!u:: Send {Home}      ;
!o:: Send {End}   ;
;Alt + jkli ʵ�ֶԷ������ӳ��,д�����ʱ��ҳ�����
!j:: Send {left}
!l:: Send {right}
!i:: Send {up}
!k:: Send {down}

;Delete Backspace��ӳ��
!f::Send {Backspace}
!d::Send {Delete}

;win+c����ȫ·��
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
