;放上自己的一套脚本,自定义了一些功能,写代码基本手不用离开键盘,特别是方向键,基本定;位在了jkli 中,上翻下翻面,删除,选择扒拉扒拉,自己选着用吧！
;url编码解码
uriEncode(str) {
   f = %A_FormatInteger%
   SetFormat, Integer, Hex
   If RegExMatch(str, "^\w+:/{0,2}", pr)
      StringTrimLeft, str, str, StrLen(pr)
   StringReplace, str, str, `%, `%25, All
   Loop
      If RegExMatch(str, "i)[^\w\.~%]", char)
         StringReplace, str, str, %char%, % "%" . Asc(char), All
      Else Break
   SetFormat, Integer, %f%
   Return, pr . str
}
uriDecode(str) {
   Loop
      If RegExMatch(str, "i)(?<=%)[\da-f]{1,2}", hex)
         StringReplace, str, str, `%%hex%, % Chr("0x" . hex), All
      Else Break
   Return, str
}

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;快速命令;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
:://g::
Run http://www.google.com
return
:://b::
Run http://www.baidu.com
return

:://s::
Run C:\LS\Everything\Everything.exe
return

:://qq::
Run C:\Program Files\Tencent\QQ\Bin\QQ.exe
return

:://cmd::
Run cmd
return

:://n::
Run notepad
return

:://d::
Run C:\Program Files\http://dict.cn\DianDian.exe
return

:://e::
Run explorer
return

;打开任务管理器
:://t::
if WinExist Windows 任务管理器
WinActivate
else
Run taskmgr.exe
return

;一些经常输入的字符串
:://m::
Send babyking1949@gmail.com
return

;打开系统属性
:://sys::
Run control sysdm.cpl
return

;打开autohotkey 配置文件
:://ahk::
Run D:\GreenSoft\AutoHotKey 中文版\AutoHotKey.ini
return
;;;;;;;;;;快速打开程序(快捷键);;;;;;;;;;;;;;;;;;;;;;;;;

;用google搜索
!g::
Send ^c
Run http://www.google.com/search?q=%clipboard%
return
;用百度搜索
!b::
Send ^c
Run http://www.baidu.com/s?wd=%clipboard%
return

!t::
Send ^c
Run http://s.taobao.com/search?q=%clipboard%
return
;快速打开记事本
#n::
If WinExist Untitled - Notepad
WinActivate
else
Run Notepad
return

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;通用键的映射;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;对windows下的一些常用键进行映射,与苹果下的一些习惯一样(苹果下的快捷键有些非常合理:)
!f::Send ^f  ;查找
!q:: !F4    ;退出
!w::Send ^w ;关闭网页窗口
!r::Send #r
!s::Send ^s ;保存
!n::Send ^n ;新建
!z::Send ^z
;选择文字
!,::Send ^+{Left}
!.::Send ^+{Right}

return
!y:: Send +{Home}  ;选择当前位置到行首的文字
!p:: Send +{End}   ;选择当前位置到行末的文字

;选择一行
!a::
Send {Home}
Send +{End}
return

;鼠标的左右键实现任务切换,对thinkpad trackpoint 特别有用
~LButton & RButton::AltTab
~LButton & MButton::MsgBox,hello

;<短时间双击alt键切换capslock键>
;~ 设置一个时钟，比如400 毫秒，
;~ 设置一个计数器，Alt_presses，按击次数，每次响应时钟把计数器清0复位
#Persistent
$Alt::
if Alt_presses > 0 ; SetTimer 已经启动，所以我们记录按键。
{
    Alt_presses += 1
    return
}
;否则，这是新一系列按键的首次按键。将计数设为 1 并启动定时器：
Alt_presses = 1
SetTimer, KeyAlt, 300 ;在 300 毫秒内等待更多的按键。
return

KeyAlt:
SetTimer, KeyAlt, off
if Alt_presses = 1 ;该键已按过一次。
{
    Gosub singleClick
}
else if Alt_presses = 2 ;该键已按过两次。
{
    Gosub doubleClick
}

;不论上面哪个动作被触发，将计数复位以备下一系列的按键：
Alt_presses = 0
return

singleClick:
send {alt}
return

doubleClick:
if GetKeyState("Capslock", "T")
SetCapsLockState,off
else
SetCapsLockState,on
return

;</短时间双击alt键切换capslock键>

;copy cut paste 的快捷键
!c::Send ^c
!x::Send ^x
!v::Send ^v

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
;!f::Send {Backspace}
!d::Send {Delete}
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;通用键的映射;(结束);;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;实用功能;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;win键 + PrintScreen键关闭屏幕
#PrintScreen::
KeyWait PrintScreen
KeyWait LWin ;释放左Win键才激活下面的命令
SendMessage,0x112,0xF170,2,,Program Manager ;关闭显示器。0x112:WM_SYSCOMMAND，0xF170:SC_MONITORPOWER。2：关闭，-1：开启显示器
Return

/*
;双击鼠标右键在窗口最大化与正常状态之间切换
WinStatus:=0
RButton::
    KeyWait, RButton    ;松开鼠标右键后才继续执行下面的代码
    keyWait, RButton, D T0.15  ;在 100 毫秒内等待再次按下鼠标右键，可以设置一个自己觉得适合的等待时间。

If ErrorLevel
        Click, Right

    Else
    {
         if WinStatus=0
{
     WinMaximize , A
     WinStatus:=1
}
else
{
     WinRestore ,A
     WinStatus:=0
}
    }
Return
!m::
if WinStatus=0
{
     WinMaximize , A
     WinStatus:=1
}
else
{
     WinRestore ,A
     WinStatus:=0
}
return

;命令行cmd里可以ctrl v
#IfWinActive ahk_class ConsoleWindowClass
^v::
MouseClick, Right, %A_CaretX%, %A_CaretY%,,0
send p
return

*/
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;实用功能(结束);;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;<Chrome>;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
#IfWinActive ahk_class Chrome_WidgetWin_1
!,::Send ^+{Tab}
!.::Send ^{Tab}
!1::Send ^+{Tab}
!2::Send ^{Tab}
!n::Send ^t
!/::Send ^w
!z::Send ^+t
!-::Send ^-
!=::Send ^=

;选择当前位置到页尾的文字,适用于浏览器
F2::
Send ^+{End}
;Send ^c
return

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;<资源管理器>;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
#IfWinActive ahk_class CabinetWClass
!f::
Run C:\Program Files\Everything\Everything.exe
return

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;<Notepad>;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
#IfWinActive ahk_class Notepad
;!u::Send ^{Home}
;!o::Send ^{End}
return

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;<Eclipse>;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
#IfWinActive,Eclipse
!.::Send ^{F8}
return

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;<VisualStudio 2008>;;;;;;;;;;;;;;;;;;;;;;;
#IfWinActive ahk_class wndclass_desked_gsk
!/::Send ^{Tab}
!.::Send ^+{Tab}
!m::Send !+{Enter}
return

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;<ADB>;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;<Onenote>;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
#IfWinActive ahk_class OfficeTooltip
!u::Send ^{Home}
!o::Send ^{End}
return