# linux 学习

- [linux 学习](#linux-%E5%AD%A6%E4%B9%A0)
    - [经典语句](#%E7%BB%8F%E5%85%B8%E8%AF%AD%E5%8F%A5)
    - [硬盘](#%E7%A1%AC%E7%9B%98)
        - [Linux中的档名](#linux%E4%B8%AD%E7%9A%84%E6%A1%A3%E5%90%8D)
    - [常用命令](#%E5%B8%B8%E7%94%A8%E5%91%BD%E4%BB%A4)
    - [常见问题](#%E5%B8%B8%E8%A7%81%E9%97%AE%E9%A2%98)
        - [Determining IP information for eth0...failed 错误解决](#determining-ip-information-for-eth0failed-%E9%94%99%E8%AF%AF%E8%A7%A3%E5%86%B3)
    - [linux 安装](#linux-%E5%AE%89%E8%A3%85)
    - [linux 文件](#linux-%E6%96%87%E4%BB%B6)
        - [文件权限 -rwxr-xr-x](#%E6%96%87%E4%BB%B6%E6%9D%83%E9%99%90--rwxr-xr-x)
        - [切换文件用户和用户组](#%E5%88%87%E6%8D%A2%E6%96%87%E4%BB%B6%E7%94%A8%E6%88%B7%E5%92%8C%E7%94%A8%E6%88%B7%E7%BB%84)
        - [`[root@www tmp]#`](#rootwww-tmp)
        - [Filesystem Hierarchy Standard (FHS)标准](#filesystem-hierarchy-standard-fhs%E6%A0%87%E5%87%86)
    - [目录](#%E7%9B%AE%E5%BD%95)
        - [文件管理](#%E6%96%87%E4%BB%B6%E7%AE%A1%E7%90%86)
        - [文件内容查阅](#%E6%96%87%E4%BB%B6%E5%86%85%E5%AE%B9%E6%9F%A5%E9%98%85)
        - [隐藏属性](#%E9%9A%90%E8%97%8F%E5%B1%9E%E6%80%A7)
        - [特殊权限](#%E7%89%B9%E6%AE%8A%E6%9D%83%E9%99%90)
        - [搜索](#%E6%90%9C%E7%B4%A2)
    - [硬盘与文件系统](#%E7%A1%AC%E7%9B%98%E4%B8%8E%E6%96%87%E4%BB%B6%E7%B3%BB%E7%BB%9F)
        - [硬连接与软连接](#%E7%A1%AC%E8%BF%9E%E6%8E%A5%E4%B8%8E%E8%BD%AF%E8%BF%9E%E6%8E%A5)
        - [硬盘分区相关命令](#%E7%A1%AC%E7%9B%98%E5%88%86%E5%8C%BA%E7%9B%B8%E5%85%B3%E5%91%BD%E4%BB%A4)
        - [磁盘检验](#%E7%A3%81%E7%9B%98%E6%A3%80%E9%AA%8C)
        - [挂载](#%E6%8C%82%E8%BD%BD)
    - [压缩](#%E5%8E%8B%E7%BC%A9)
        - [dump完整备份](#dump%E5%AE%8C%E6%95%B4%E5%A4%87%E4%BB%BD)
        - [restore 还原备份](#restore-%E8%BF%98%E5%8E%9F%E5%A4%87%E4%BB%BD)
    - [vim编辑器](#vim%E7%BC%96%E8%BE%91%E5%99%A8)
        - [指令图片](#%E6%8C%87%E4%BB%A4%E5%9B%BE%E7%89%87)
        - [特殊](#%E7%89%B9%E6%AE%8A)
    - [shell脚本](#shell%E8%84%9A%E6%9C%AC)
        - [bash优点](#bash%E4%BC%98%E7%82%B9)
        - [内建命令](#%E5%86%85%E5%BB%BA%E5%91%BD%E4%BB%A4)
        - [变量](#%E5%8F%98%E9%87%8F)
        - [变量内容修改](#%E5%8F%98%E9%87%8F%E5%86%85%E5%AE%B9%E4%BF%AE%E6%94%B9)
        - [判断是否当前有值,然后赋值](#%E5%88%A4%E6%96%AD%E6%98%AF%E5%90%A6%E5%BD%93%E5%89%8D%E6%9C%89%E5%80%BC%E7%84%B6%E5%90%8E%E8%B5%8B%E5%80%BC)
        - [别名](#%E5%88%AB%E5%90%8D)
        - [历史命令 history](#%E5%8E%86%E5%8F%B2%E5%91%BD%E4%BB%A4-history)
        - [命令搜索顺序](#%E5%91%BD%E4%BB%A4%E6%90%9C%E7%B4%A2%E9%A1%BA%E5%BA%8F)
        - [进站信息](#%E8%BF%9B%E7%AB%99%E4%BF%A1%E6%81%AF)
        - [环境配置文件](#%E7%8E%AF%E5%A2%83%E9%85%8D%E7%BD%AE%E6%96%87%E4%BB%B6)
        - [其他配置文件](#%E5%85%B6%E4%BB%96%E9%85%8D%E7%BD%AE%E6%96%87%E4%BB%B6)
        - [shell常用快捷键](#shell%E5%B8%B8%E7%94%A8%E5%BF%AB%E6%8D%B7%E9%94%AE)
        - [通配符](#%E9%80%9A%E9%85%8D%E7%AC%A6)
    - [正则表达式](#%E6%AD%A3%E5%88%99%E8%A1%A8%E8%BE%BE%E5%BC%8F)
        - [grep过滤字符串 以行为单位](#grep%E8%BF%87%E6%BB%A4%E5%AD%97%E7%AC%A6%E4%B8%B2-%E4%BB%A5%E8%A1%8C%E4%B8%BA%E5%8D%95%E4%BD%8D)
        - [sed 比grep增加替换功能 stream editor](#sed-%E6%AF%94grep%E5%A2%9E%E5%8A%A0%E6%9B%BF%E6%8D%A2%E5%8A%9F%E8%83%BD-stream-editor)
        - [egrep 或 grep -E](#egrep-%E6%88%96-grep--e)
        - [文件格式化与数据处理](#%E6%96%87%E4%BB%B6%E6%A0%BC%E5%BC%8F%E5%8C%96%E4%B8%8E%E6%95%B0%E6%8D%AE%E5%A4%84%E7%90%86)
    - [shell 脚本](#shell-%E8%84%9A%E6%9C%AC)
        - [Hello World程序](#hello-world%E7%A8%8B%E5%BA%8F)
        - [务必加注释](#%E5%8A%A1%E5%BF%85%E5%8A%A0%E6%B3%A8%E9%87%8A)
        - [对谈式脚本](#%E5%AF%B9%E8%B0%88%E5%BC%8F%E8%84%9A%E6%9C%AC)
        - [数值加减](#%E6%95%B0%E5%80%BC%E5%8A%A0%E5%87%8F)
        - [运行方式差异](#%E8%BF%90%E8%A1%8C%E6%96%B9%E5%BC%8F%E5%B7%AE%E5%BC%82)
        - [test 条件判断](#test-%E6%9D%A1%E4%BB%B6%E5%88%A4%E6%96%AD)
        - [判断符号[] 常常用在if判断中](#%E5%88%A4%E6%96%AD%E7%AC%A6%E5%8F%B7-%E5%B8%B8%E5%B8%B8%E7%94%A8%E5%9C%A8if%E5%88%A4%E6%96%AD%E4%B8%AD)
        - [if语句](#if%E8%AF%AD%E5%8F%A5)
        - [case语句](#case%E8%AF%AD%E5%8F%A5)
        - [function函数](#function%E5%87%BD%E6%95%B0)
        - [while循环 条件不成立终止 unitl条件成立终止](#while%E5%BE%AA%E7%8E%AF-%E6%9D%A1%E4%BB%B6%E4%B8%8D%E6%88%90%E7%AB%8B%E7%BB%88%E6%AD%A2-unitl%E6%9D%A1%E4%BB%B6%E6%88%90%E7%AB%8B%E7%BB%88%E6%AD%A2)
        - [for循环](#for%E5%BE%AA%E7%8E%AF)
        - [bug调试](#bug%E8%B0%83%E8%AF%95)
    - [账号管理](#%E8%B4%A6%E5%8F%B7%E7%AE%A1%E7%90%86)
        - [帐号管理](#%E5%B8%90%E5%8F%B7%E7%AE%A1%E7%90%86)
    - [文件系统管理](#%E6%96%87%E4%BB%B6%E7%B3%BB%E7%BB%9F%E7%AE%A1%E7%90%86)
    - [maven仓库镜像](#maven%E4%BB%93%E5%BA%93%E9%95%9C%E5%83%8F)
    - [常用缩写](#%E5%B8%B8%E7%94%A8%E7%BC%A9%E5%86%99)
        - [1. 目录缩写](#1-%E7%9B%AE%E5%BD%95%E7%BC%A9%E5%86%99)
        - [2. 命令缩写](#2-%E5%91%BD%E4%BB%A4%E7%BC%A9%E5%86%99)
        - [3. 编程相关缩写](#3-%E7%BC%96%E7%A8%8B%E7%9B%B8%E5%85%B3%E7%BC%A9%E5%86%99)
        - [4. 递归缩写](#4-%E9%80%92%E5%BD%92%E7%BC%A9%E5%86%99)
        - [5. 其他缩写](#5-%E5%85%B6%E4%BB%96%E7%BC%A9%E5%86%99)
        - [6. 参考资料](#6-%E5%8F%82%E8%80%83%E8%B5%84%E6%96%99)

## 经典语句

> 在Windows里面,设定不好设备,您可以骂它;在Linux里面,如果设定好设备了,您得要感激它!  
> 没有安装过Linux十次以上,不要说你学会了Linux了啦!慢慢体会这句话吧! ^_^  
> 没有信息就是『好信息』！  

## 硬盘

### Linux中的档名

| 装置                | 装置在Linux内的档名                      |
| ------------------- | ---------------------------------------- |
| IDE硬盘机           | /dev/hd[a-d]                             |
| SCSI/SATA/U盘硬盘机 | /dev/sd[a-p]                             |
| U盘快闪碟           | /dev/sd[a-p](与SATA相同)                 |
| 软盘机              | /dev/fd[0-1]                             |
| 打印机              | 25针: /dev/lp[0-2]U盘: /dev/usb/lp[0-15] |
| 鼠标                 | U盘: /dev/usb/mouse[0-15]PS2: /dev/psaux |
| 当前CDROM/DVDROM    | /dev/cdrom                               |
| 当前的鼠标           | /dev/mouse                               |
| 磁带机              | IDE: /dev/ht0SCSI: /dev/st0              |

## 常用命令

`uname -sr` 系统核心版本

`date` 当前日期 date  
`cal` 日历  
`bc` 计算器 默认整数 scale=3 保留三位有效数字 quit退出  
`exit` 退出 ctrl+d  
`man [command]` 查找命令用法/ [command] --help 相似

**关机**  
`sync`>`shutdown` or `reboot` 注意 shutdown 加时间只会结束服务,加上-h会在结束服务后立刻关机 shutdown会发提示关机命令给所有在线用户  

`cat` << EOF(定义结束符)  
first  
second  
EOF

`useradd [username]` 增加用户  
`passwd [username]` 修改口令/不加口令则该自己  
`chage -d 0 [username]` 强制用户登陆一次之后改密码  
`echo "password" | passwd --stdin [username]` 用命令给用户改密码不用两次输入  

`which [command]` 命令在哪儿  

## 常见问题

### Determining IP information for eth0...failed 错误解决

VMware dhcp服务没有开  

`uname -r` 内核版本  
`lsb_release -a`  LSB (Linux Standard Base) and Distribution   information

## linux 安装

**basic server 安装时默认没有开启eth0网卡**  
将eth0中的onboot设置改为yes `/etc/sysconfig/network-scripts/ifcfg-eth0`中的设置更改 更改完成后 `service network restart`  
单次更改可以改为`ifup eth0`  

centos7中取消`ifconfig`命令 可安装`net-tools` 或者使用`ip addr`  

## linux 文件

### 文件权限 -rwxr-xr-x

含义
> 第一个当为[ d ]则是目录  
当为[ - ]则是文件  
若是[ l ]则表示为连结档(link file);  
若是[ b ]则表示为装置文件里面的可供储存的接口设备(可随机存取装置);  
若是[ c ]则表示为装置文件里面的串行端口设备,例如键盘、鼠标(一次性读取装置).
> rwx 读写运行权限  
> 第一组文件拥有者 第二组同组权限 第三组其他人权限  
> rwx对文件来说是针对内容来讲,r可以读取内容,w可以改写内容,x是可执行文件  
> rwx对文件夹来说,r可读取文件列表,w可增删文件,x可进入文件  

### 切换文件用户和用户组  

`chgrp [-R] GROUP FILE`  
`chown [-R] OWNER:GROUP FILE`  
`chmode [[u/g/o/a] [+/-/=] [rwx]] file` 例子 chmod  u=rwx,go=rx  .bashrc 与chmod 755 .bashrc一样 chmod  a+w  .bashrc 增加可写权限 chmod 4775 filename 其中4位的第一位表示SUID4/SGID2/SBIT1  
要开放目录给任何人浏览时,应该至少也要给予r及x的权限,但w权限不可随便给;  

### `[root@www tmp]#`  

输入命令为#是root,输入命令$其他

### Filesystem Hierarchy Standard (FHS)标准

|                    | 可分享的(shareable)          | 不可分享的(unshareable) |
| ------------------ | ---------------------------- | ----------------------- |
| 不变的(static)     | /usr   (软件放置处)          | /etc   (配置文件)       |
|                    | /opt   (第三方协力软件)      | /boot   (开机与核心档)  |
| 可变动的(variable) | /var/mail   (使用者邮件信箱) | /var/run   (程序相关)   |
|                    | /var/spool/news   (新闻组)   | /var/lock   (程序相关)  |

FHS针对目录树架构仅定义出三层目录底下应该放置什么数据而已,分别是底下这三个目录的定义:  
`/` (root, 根目录):与开机系统有关;  
`/usr` (unix software resource):与软件安装/执行有关;  
`/var` (variable):与系统运作过程有关.  

**`/`** 目录下  
`/bin` 可执行文件目录,单人维护使用  
`/boot` 开机文件目录  
`/dev` 设备device  
`/etc` 配置(et cetra 法语 相当于英语and so on 等等) 其中比较重要/etc/inittab,/etc/init.d,/etc/modprobe.conf,/etc/X11/,/etc/fstab,/etc/sysconfig/  
`/home` 家目录home directory  
`/lib` 系统函数库  
`/media` 可移除设备 /media/floppy, /media/cdrom  
`/mnt` 暂时挂载  
`/opt`  第三方协力软件放置的目录  
`/root` root家目录  
`/sbin` root命令,开机使用 其他放置在/usr/sbin/ (服务器应用)和 /usr/local/sbin/ (本机自行安装软件产生目录)中  
`/srv` 服务器启动后的数据目录如/srv/www  
`/tmp` 使用者或者程序临时纺织文件的地方  

**`其他`**  
`/lost+found` ext2/3/4 会产生的目录,系统错误时一些遗失的片段放在此  
`/proc` 虚拟文件系统,放置在内存中 不占硬盘容量 如系统核心、行程信息(process)、周边装置的状态及网络状态  
`/sys` 虚拟的文件系统 记录与核心相关的信息  

不可与根目录分开`/etc` `/bin` `/dev` `/lib` `/sbin`  

**`/usr`** 目录下(unix software resource)Unix操作系统软件资源 类似于'C:\Windows\ + C:\Program files\'  
`/usr/X11R6` x window system重要数据11版第6次  
`/usr/bin/` 绝大部分用户指令  
`/usr/include` c/c++等语言的include文件  
`/usr/lib` 函数库  
`/usr/local` 本机自行安装的软件建议放置此目录  
`/usr/sbin` 非系统正常运作所需要的指令  
`/usr/share` 共享文件的地方  
`/usr/src` 源码放置的目录  

**`/var`** 目录含义variable 可变动 主要是常态性变动的文件 如缓存 登录档 软件产生的文件  
`/var/cache` 暂存档  
`/var/lib` 程序执行过程中使用的数据文件 如/var/lib/mysql/  
`/var/lock` 锁定的文件  
`/var/log` 登录文件放置的目录  
`/var/mail` 电子邮件  
`/var/run/` 存放pid  
`/var/spool` 队列数据  

## 目录

`.` 代表此层目录  
`..` 代表上一层目录  
`-` 代表前一个工作目录  
`~` 代表『目前使用者身份』所在的家目录  
`~account` 代表 account 这个使用者的家目录(account是个帐号名称)  

`cd` 变换目录 change directory  
`pwd` 显示当前目录 print working directory pwd -P 显示真实路径 非链接  
`mkdir` 创建新目录 -p自动建父目录 -m指定权限  
`rmdir` 删除空目录 -p上一级空目录也删  
为了安全不建议将.即当前目录加入PATH  

### 文件管理  

`ls [-aAdfFhilnrRSt] 目录名称` 文件与目录检视  
`cp [-adfilprsu] 来源档(source) 目标档(destination)` 复制 cp -l 硬连接 -s 软连接 i-node  
`rm [-fir] 文件或目录` 删除目录  
`mv [-fiu] source destination`  
`basename /a/b/c/123` 查看路径文件名,返回123  
`dirname /a/b/c/123` 查看路径目录,返回/a/b/c  

### 文件内容查阅  

`cat`  由第一行开始显示文件内容  cat -n 行号  -b 不显示空白行  
`tac`  从最后一行开始显示,可以看出 tac 是 cat 的倒著写!  
`nl`   显示的时候,顺道输出行号! 更多行号设置更能  
`more` 一页一页的显示文件内容  
`less` 与 more 类似,但是比 more 更好的是,他可以往前翻页!  
`head` 只看头几行  
`tail` 只看尾巴几行  
`od`   以二进位的方式读取文件内容! od -t xCc filename ASCII 与字节的对照表  

`touch [-acdmt] 文件 修改文档时间` -a 仅accesstime -c仅修改时间不创建 -d 修改为其他时间 -m mtime -t 修改时间[YYMMDDhhmm]  
modification time (mtime):内容更改时间  
status time (ctime):状态(属性权限)更改时间  
access time (atime):内容获取时间  

`umask` 文件默认权限 文档默认666 文件夹默认777 减去umask值为默认权限 umask 002 修改默认权限  在/etc/bashrc中设置默认值  

### 隐藏属性  

`chattr` 修改文件的隐藏属性 +i不能删除改名修改 +a只能增加不能删除修改  
`lsattr` 显示文件的隐藏属性  

### 特殊权限  

`SUID`, `SGID`, `SBIT`  
SUID Set UID 运行期间取得拥有者权限  
SUID 仅可用在binary program 上, 不能够用在 shell script 上面!和目录上  
SBIT Sticky Bit 尽可用于目录,创建者和root用户可对目录内文件有删除更名移动的权限  
SUID 4/ SGID 2/ SBIT 1   chmod 4775 filename  
大写ST表示没有此权限,因为拥有者用户没有此权限  

`file filename` 观察文件类型  

### 搜索  

`which [-a] command` 命令路径在PATH中找  
`type command` 命令类型  
`whereis [-bmsu] 文件或目录名` -b binary类型-m manual路径下文件 -s source 来源文件 -u不在以上找  
`find [PATH] [option] [action]` 搜寻硬盘  
时间相关find /tmm -mtime +4/-4/4 含义 +4 大于5天,-4小于四天,4 4-5天 -newer filename  比filename新的文件  
用户相关find /home -user lau 找出lau的文件 参数有-uid -gid -user -group  -nouser -nogroup  
文件权限与名称相关 -name -size -type [f,b,c,d,l,s,p] -perm mode/+mode/-mode  
额外功能 find / -perm +7000 -exec ls -l {} \; 执行额外的命令 -print 打印到萤幕上默认 -a 合并 -o 或者  
`locate [-ir] keyword` 查找 -i 忽略大小写 -r 正则写法 从数据库中查找 updatedb 更新数据库  

## 硬盘与文件系统

`dumpe2fs 装置名称` 列出文件系统信息 -h 仅superblock数据 -b 仅坏道  
`du [-ahskm] 文件或目录名称` 所有的文件数据容量  -S 减少目录汇总  
`df [-ahikHTm] [目录或文件名]` 目前挂载的装置 常用-h -a -i  

`superblock`:记录此 filesystem 的整体信息,包括inode/block的总量、使用量、剩余量, 以及文件系统的格式与相关信息等;  
`inode`:记录文件的属性,一个文件占用一个inode,同时记录此文件的数据所在的 block 号码; CentOS5 128Bytes  CentOS6默认256Byte  
`block`:实际记录文件的内容,若文件太大时,会占用多个 block . 1k 2k 4k  

`索引式文件系统(indexed allocation)`.  

目录的inode存属性,block存文件名和对应的inode,ls -li 可查看文件名inode号码,目录至少占用一个block不够了再加  
文件的inode存属性,block存内容  

**读取文件步骤**  
/etc/passwd 读取步骤 先找/的inode 通过挂载点信息找,同时读权限; 然后找/的block找出etc/的inode号码;etc/的block找到passwd的inode;passwd的inode相关权限和block位置;passwd的block读取内容  

**写入文件步骤**  
先确定是否在新增目录有wx权限;根据inode bitmap查找空inode,写权限;根据block bitmap找空block,数据写入block,升级inode的block;将inode和block的数据同步到inode bitmap和block bitmap,并更新superblock  

**不一致状态**  
写入过程中断电等情况,使用e2fsck程序检查,同时ext3以后增加日志系统,避免全盘扫描  

**挂载后才可使用**  
linux通过VFS(Virtual Filesystem Switch)管理文件系统  

### 硬连接与软连接  

在inode级别连接是硬链接可以通过ls -li查看  
软连接是通过存路径的方式  

### 硬盘分区相关命令  

`fdisk 装置名称` 进行分区 其中m列出命令 p打印更改后的分割表 n增加分区 d删除 w写入 q不保存退出 fdisk无法处理2T以上的数据,可以使用parted命令  
`mkfs [-t 文件系统格式] 装置文件名` 磁盘格式化命令  
`mke2fs [-b block大小] [-i block大小] [-L 标头] [-cj] 装置` 详细配置格式化信息  

### 磁盘检验  

`fsck [-t 文件系统] [-ACay] 装置名称` 检查文件系统是否出错 filesystem check  
`badblocks -[svw] 装置名称` 检查坏道  

### 挂载  

`mount -a` 依照配置文件 /etc/fstab 的数据将所有未挂载的磁盘都挂载上来  
`mount -l` 显示Label 名称  
`mount [-t 文件系统] [-L Label名] [-o 额外选项] [-n]  装置文件名  挂载点`  
`mount -o remount,rw,auto /` 重新挂载根目录  
`umount [-fn] 装置文件名或挂载点` 卸载  

`e2label 装置名称  新的Label名称 修改label名`  
`tune2fs [-jlL] 装置代号` 修改设备信息 -l类似 dumpe2fs -h 的功能 -j带日志 -L修改label  

`/etc/fstab` 启动时的挂载信息 Device/Mount point/filesystem/parameters/dump/fsck  
`/etc/mtab` 实际挂载情况  

## 压缩

`compress` 非常老的压缩程序  默认档名*.Z  
`compress [-rcv] 文件或目录`  <==这里是压缩  -r连同目录压缩  -c压缩输出到荧幕 -v显示变化  压缩时会删除源文件  compress -c man.config > man.config.back.Z 此种方式可保留源文件
`uncompress 文件.Z`           <==这里是解压缩  

`gzip`压缩  使用广泛  默认档名*.gz  
`gzip [-cdtv#] 档名`  -c输出银幕,配合重定向  -d解压缩 -t检查一致性  -v输入过程  -#等级 -1最快压缩比差 -9最高  
`zcat 档名.gz`  查看文件列表  zcat类似cat不过只能看文件列表  

`bzip2` 压缩比高  默认档名*.bz2  
`bzip2 [-cdkzv#] 档名`  -k保留源文件 -z压缩  bupzip2 等于 bzip2 -d 解压缩
`bzcat 档名.bz2`  

`tar` 打包命令 可以把一堆文件打包成一个  默认档名*.tar 压缩后*.tar.gz *.tar.bz2  
`tar [-j|-z] [cv] [-f 创建的档名] filename...` <==打包与压缩  
`tar [-j|-z] [tv] [-f 创建的档名]`             <==察看档名  
`tar [-j|-z] [xv] [-f 创建的档名] [-C 目录]`   <==解压缩  
tar 参数 -c创建打包文件create -t查看文件list -x解压缩解打包extract -j压缩bzip2 -z压缩gzip -v显示过程 -f filename 紧跟要处理的档名 -C directory紧跟目录 -p保留权限属性 -P保留绝对路径 默认相对路径 最好不要用-P --exclude=FILE 不打包文件
例子
> 压　缩:tar -jcv -f filename.tar.bz2 要被压缩的文件或目录名称  
查　询:tar -jtv -f filename.tar.bz2  
解压缩:tar -jxv -f filename.tar.bz2 -C 欲解压缩的目录  
单一文件  tar -jxv -f 打包档.tar.bz2 待解开档名  
tarfile  tar包未压缩  
tarball  tar包压缩  

### dump完整备份  

`dump [-Suvj] [-level] [-f 备份档] 待备份数据` 参数-S需要多少空间 -u记录到/etc/dumpupdates中 -v 显示过程 -j 加入bzip2支持 -level等级 -f 文件名  
`dump -W` 列出/etc/fstab中的是否有备份  

### restore 还原备份  

`restore -t [-f dumpfile] [-h]`        <==用来察看 dump 档  
`restore -C [-f dumpfile] [-D 挂载点]` <==比较dump与实际文件  
`restore -i [-f dumpfile]`             <==进入互动模式  
`restore -r [-f dumpfile]`             <==还原整个文件系统  
参数 -t 查看dump数据 -C比较 -i互动模式 -r还原 -h显示inode与label -f要处理的文件 -D挂载点与-C联用  

`mkisofs`:创建映像档  
`cdrecord`:光盘烧录工具  

`dd` 备份整颗 partition 或 整颗 disk  tar备份数据  
`dd if="input_file" of="output_file" bs="block_size" count="number"`
例子
> 将 /etc/passwd 备份到 /tmp/passwd.back 当中  
dd if=/etc/passwd of=/tmp/passwd.back  
> 将自己的磁碟之第一个磁区备份下来  
dd if=/dev/hdc of=/tmp/mbr.back bs=512 count=1  

`cpio` 为相当优秀的备份命令

## vim编辑器

**`三种模式`** 一般模式,编辑模式,指令行模式(:/?)  

`一般模式`:移动删除复制粘贴  
`编辑模式`:输入替换文字  
`指令行模式`:读取存储搜索等  

一般模式-->编辑模式i/o/a/R 返回esc  
一般模式-->指令行模式:/? 返回esc  
编辑模式与指令行模式不可切换  

### 指令图片  

以命令为导向  
![指令1](image/vim-commands.jpg)

以键盘为导向  
![指令2](image/vi-vim-cheat-sheet-sch.gif)

### 特殊  

`替换` :n1,n2s/old/new/g 其中n2可以是$表示最后
`区块选择` v字符选择 V行选择 ctrl+v区块选择 y复制 d删除  
`多档案` :n 下一个档案 :N上一个档案 :files所有的档案  
`多窗口` :sp 分成两个 :sp filename 分两个 ctrl+w +j/↓ 下一个窗口 ctrl+w +k/↑上一个窗口 ctrl+w +q离开  
`vim环境设定与记录` ~/.vimrc  ~/.viminfo  
例子
> vim ~/.vimrc  
"这个档案的双引号 (") 是批注  
set hlsearch            "高亮度反白  
set backspace=2         "可随时用退格键删除  
set autoindent          "自动缩排  
set ruler               "可显示最后一行的状态  
set showmode            "左下角那一行的状态  
set nu                  "可以在每一行的最前面显示行号啦!  
set bg=dark             "显示不同的底色色调  
syntax on               "进行语法检验,颜色显示.  

`换行符`  
linux/unix \n LF  $  
windows \r\n CRLF  ^M$  
Carriage-Return Line-Feed \r=return \n=newline  

`dos2unix [-kn] file [newfile]`  -k保留mtime -n 保留旧文档 dos2unix -n old new  
`unix2dos [-kn] file [newfile]`  
`iconv  --list`  
`iconv -f 原本编码 -t 新编码 filename [-o newfile]`  

`vim中使用tr`替换 %s/.*/\=tr(submatch(0), 'ABCD', 'PQRS') 将A换成P B换成Q C换成R D换成S

## shell脚本

shell 是壳程序,用来操作内核,从而控制硬件  
`shell好处`:文件接口大家都一样,远程管理文字接口快,配合shell scripts,好用  
`shell版本众多`,linux支持的shell可以在/etc/shells中查看,最常用的是bash  
passwd文件中账户最后一个字段就是登录之后默认的shell类型  

### bash优点

记忆功能↑↓键可找命令,tab补全命令 补全文件名,配置别名alias,前后台控制,程序化脚本,通配符  

### 内建命令  

type  查看命令类型  type [-tpa] name 参数 -t简短类型(file alias builtin) -p外部命令显示 -a所有(包括PATH和alias) 类似于which  
\ 转移字符 下达命令长的时候可使用  

### 变量

MAIL HOME PATH 等方便操作与编程  
`读取变量` echo $MAIL/${MAIL}  {}的作用主要是界定  
`赋值` myname=lautumn 前后不要加空格,开头不能是数字,有空格可用""或''或转义,单引号变量原样输出,双引号可加变量,\为转义符号,『\`命令\`』或 『$(命令)』可用来获取命令结果,"$变量" 或 ${变量} 再赋值可拼接,`export` 变量 可转为环境变量,一般为大写字母,`unset`取消配置  
例子
> 经常去此目录,可设为变量  
work="/cluster/server/work/taiwan_2005/003/"  
cd $work  

**`查询变量`**
`env` 查询环境变量  HOME SHELL HISTSIZE MAIL PATH LANG  
`set` 所有变量(包括自定义)  PS1  提示字符的配置 ,$ 本shell的PID,?上一个命令的回传值,成功0,OSTYPE, HOSTTYPE, MACHTYPE:(主机硬件与核心的等级)  
`export` 自定义变量转成环境变量  可被子程序使用  
`locale`  语系变量  locale -a 查询所有 locale 显示当前  修改默认语系/etc/sysconfig/i18n  

`read` 让用户输入变量的值  `read [-pt] variable`  参数-p 提示字符 -t等待秒数  
`declare [-aixr] variable`  宣告变量的类型,和typeset一样  参数-a数组,-i整型,-x设成环境变量,-r设成只读不能unset和更改  例子 declare -i sum=100+300+500 这样才会计算  

`声明数组`  循环取值中有意义  
var[1]='samll man'  
var[2]='big man'  
var[3]='nice man'
echo "${var[1]}, ${var[2]}, ${var[3]}"

`ulimit`设置文件系统大小
ulimit [-SHacdfltu] [配额]  参数-H严格设置 -S警告设置 -a列出所有限制 -c出错将内存写入文件 -f最大文件容量 -d最大断裂内存 -l锁定内存量 -t最大cpu秒数 -u最大程序数  

### 变量内容修改  

${var#word}     左到右最短删除
${var##word}    左到右最长删除
${var%word}     右到左最短删除
${var%%word}    右到左最长删除
${var/old/new}  第一个被取代
${var//old/new} 所有的被取代

### 判断是否当前有值,然后赋值  

var=${str-expr} 无配置var=expr 有配置 var=$str  
var=${str+expr} 无配置var=$str(空) 有配置 var=expr  
var=${str=expr} 无配置str=var=expr 有配置 var=$str  
var=${str?expr} 无配置expr输出stderr,可用作提示 有配置 var=$str  
如果var=${str:-expr} 则判断配置是否为空,如果为空则相当于无配置  

### 别名  

alias lm='ls -al | more'  
alias 显示所有别名  
unalias lm  

### 历史命令 history

`history [n]` 最近几行
`history [-c]` 清除当前shell命令
`history [-raw] histfiles` 参数 -r读取histfiles 默认~/.bash_history -a新增的写入histfiles -w写入histfiles中  
history 结合! 命令  
`!66` 运行第66条命令  
`!!` 运行上一条命令  
`!al` 运行最近以al开头的命令  

### 命令搜索顺序  

1. 绝对相对路径运行
1. alias命令
1. bash内建命令
1. PATH命令  

### 进站信息  

`/etc/issue` 登录之前提示  可在man mingetty中查看转义字符的意义  
`/etc/issue.net` 远程登录提示 在/etc/ssh/sshd_config中修改Banner为Banner /etc/issue.net  
`/etc/motd` 登录之后提示  message of today  

### 环境配置文件  

`login shell`  先读取/etc/profile,然后读取~/.bash_profile 或 ~/.bash_login 或 ~/.profile个人配置  其中profile会配置PATH MAIL USER HOSTNAME HISTSIZE 还会读取/etc/inputrc /etc/profile.d/*.sh /etc/sysconfig/i18n的内容; ~/.bash_profile  会读取~/.bashrc,而 ~/.bashrc读取/etc/bashrc  

source 配置文件名 source ~/.bashrc  .  ~/.bashrc命令相同  

`non-login shell` 只会读取~/.bashrc,由.bashrc读取/etc/bashrc centos特有  

### 其他配置文件  

`/etc/man.config` 主要的是MANPATH这个变量  
`~/.bash_history` 记录历史数据  
`~/.bash_logout` 注销后系统执行  

`stty -a`终端机所有配置  stty erase ^h 删除键改为ctrl+h  
`set` 配置终端环境  `set [-uvCHhmBx]` 默认himBH  参数-u显示错误信息 -v显示原始内容 -x显示命令内容 -h记录命令 -H交互时显示历史命令 -m工作管理 -B[]作用 -C >若存在不覆盖 -i交互 echo $- 查看当前模式  

`/etc/inputrc` 配置的是热键

### shell常用快捷键

`ctrl+w` 删除一个单词  
`ctrl+u` 删除当前所有  
`ctrl+k` 删除之后所有  
`ctrl+a` 移动到开头  
`ctrl+e` 移动到结尾  
`ctrl+左` 移动到前一个单词  
`ctrl+右` 移动到后一个单词  
`ctrl+r` 查找命令,反向查找  怕过的话可进行修改正向查找  "\C-f": forward-search-history 加入/etc/inputrc末尾重启或打开新shell即可  
`ctrl+s` 暂停输出  
`ctrl+q` 恢复输出  
`ctrl+z` 暂停目前命令  
`ctrl+c` 中止命令
`ctrl+d` 输入结束符  

快速删除密码 `ctrl+u` 或者 `esc+backspace`  

### 通配符  

*任意多 ?一个 [a-d]a-d中的一个 [^ac]非ac

**`特殊符号`**  
`#`注释 `\`转义 `|`管道 `;`命令分隔 `~`家目录 `$`取值 `&`背景工作 `!`逻辑非 `/`目录分隔符 `>` `>>`输出导向 `<` `<<`输入导向 `''`不置换变量 `""`置换变量 ` `` `取命令值或`$()` `()`子shell开始结束 `{}`命令区块组合  

`导向`  
标准输入　　(stdin) :代码为 0 ,使用 < 或 << ;  
标准输出　　(stdout):代码为 1 ,使用 > 或 >> ;  
标准错误输出(stderr):代码为 2 ,使用 2> 或 2>> ;  

`/dev/null` 垃圾桶  
find /home -name .bashrc > list 2>&1  
find /home -name .bashrc &> list  
find /home -name .bashrc > list 2> list  <==错误 这样会错乱

cat > catfile < ~/.bashrc 将.bashrc内容复制到catfile中  
cat > catfile << "eof"  定义结束符为eof  

`&&` 命令短路与 `c1&&c2` c1正确执行c2 c1错误不执行
`||` 命令短路或 `c1||c2` 相反  
`c1&&c2||c3` 一般c2 c3肯定能执行,c1正确c2执行,c3不执行  c1错误c3执行
`c1||c2&&c3` c1错误c2执行,c3执行  

`管道命令`  
ls -al /etc | less  

`cut`  分隔  
cut -d'分隔字符' -f fields  
cut -c 字符区间  

`grep`  过滤  
grep [-acinv] [--color=auto] '搜寻字符串' filename 参数 -a binary以text方式搜索 -c计算次数 -i忽略大小写 -n行号 -v取非 --color=auto 显示颜色  

`sort` `wc` `uniq`排序命令
sort [-fbMnrtuk] [file or stdin] 参数 -f忽略大小写 -b忽略最前面空格 -M以月份排序 -n数字排序(默认文本) -r倒序 -u过滤相同 -t分隔符 -k指定区间  
cat /etc/passwd | sort -t ':' -k 3  
last | cut -d ' ' -f1 | sort  

uniq [-ic] 去重 -i忽略大小写 -c计数  
wc [-lwm] 统计 -l仅行 -w仅单词 -m字符数  

`tee` 双向重定向 -a累加  
last | tee last.list | cut -d " " -f1 一份显示过滤一份记录到last.list  

`tr` `col` `join` `paste` `expand`字符转换

`tr [-ds] SET1 ...` 替换或删除文字 -d删除 -s替换  
last | tr '[a-z]' '[A-Z]'  
cat /etc/passwd | tr -d ':'  

`col [-xb]` 参数-x tab转空格,-b去除转义字符  cat -A会显示转义字符  
man col | col -b > /root/col.man  

`join [-ti12] file1 file2` 合并内容 -t分隔符 -i忽略大小写 -1 第一个文件字段 -2 第二个文件字段  join之前要先排序,否则会丢失内容  
join -t ':' -1 4 /etc/passwd -2 3 /etc/group  

`paste [-d] file1 file2 ...` 将相同行贴在一起  
`expand [-t] file` 将tab转空格 参数一个tab多少个空格 grep '^MANPATH' /etc/man.config | head -n 3 | expand -t 6 - | cat -A  

`split` 分割文件  
`split [-bl] file PREFIX`  参数-b大小 后加单位b k m等 -l行数为单位  
cd /tmp; split -b 300k /etc/termcap termcap  
`xargs` 参数转换  
`xargs [-0epn] command` 参数 -0 还原特殊字符 -e到哪儿截止 -p询问 -n每次参数个数  
cut -d':' -f1 /etc/passwd | xargs -p -n 5 finger  
cut -d':' -f1 /etc/passwd | xargs -p -e'lp' finger  
find /sbin -perm +7000 | xargs ls -l  

## 正则表达式

通配符和正则表达式不同 bash中是通配符 区别 如*在bash中表示任意多字符,正则中表示前一字符任意次  
支持正则的工具有vi grep awk sed等  
cp ls中仅支持通配符而已

### grep过滤字符串 以行为单位  

grep [-A] [-B] [--color=auto] '搜寻字串' filename 参数-n显示行数当前行: 前后行- -A后几行-B前几行  --color颜色  -v排除  -i忽略大小写  
dmesg | grep -n --color=auto 'eth'  
正则 [list]表集合 [a-z]表范围 [^z]排除z  ^the the在行首 the$ the在行尾 `\.`转义字符. ^$表示空白行 .表示任意字符 *重复任意次 `\{1,10\}`重复次数需加转义  

### sed 比grep增加替换功能 stream editor  

sed [-nefr] [动作] 参数 -n静默模式 -e编辑模式(单一动作默认) -f写入文件 -r延伸正则 -i直接改内容 n1,n2 function 在n1到n2内操作 function有 a新增 c取代 d删除 i插入 p打印 s取代 如:1,20s/old/new/g  

```shell
> nl /etc/passwd | sed '2,5d' #删除2,5行  
nl /etc/passwd | sed '2a drink tea'  #第二行之后添加  
nl /etc/passwd | sed '2i drink tea'  #第二行之前添加  
nl /etc/passwd | sed '2,5c No 2-5 number'  #2-5行替换为No 2-5 number
nl /etc/passwd | sed -n '5,7p' #仅列出5-7行
ifconfig eth0 | grep 'inet addr' | sed 's/^.*addr://g' | sed 's/Bcast.*$//g' #替换为空,即删除
cat /etc/man.config | grep 'MAN'| sed 's/#.*$//g' | sed '/^$/d' #删除空格与注释
cat /etc/man.config | grep 'MAN'| sed -e 's/#.*$//g' -e '/^$/d' #删除空格与注释
sed -i 's/\.$/\!/g' regular_express.txt #直接修改文件
sed -i '$a # This is a test' regular_express.txt #在最后一行加入内容
```

### egrep 或 grep -E

延伸正则 +一个以上 ?零个或一个 |两个取一个 ()分组 ()+分组至少一个  

### 文件格式化与数据处理  

`printf` 格式化打印  
printf '列印格式' 实际内容 转义字符 \a警告声 \b删除键 \f清除 \n换行 \r回车 \t制表符 \v垂直制表符 \xNN字节转换 如\x41是A %ns字符串 %ni数字 %n.mf小数 其中n是位数大于0右对齐 小于0左对齐 m为小数点位数

`awk` 数据处理工具  
`awk '条件类型1{动作1} 条件类型2{动作2} ...' filename`  
NF 总列数 NR第几行 FS分隔符 OFS输出分隔符  
awk 逻辑运算符 > < >= <= == !=  

```shell
last -n 5 | awk '{print $1 "\t" $3}' #以空格分 打印1和3列
last -n 5| awk '{print $1 "\t lines: " NR "\t columns: " NF}' #查看当前行数与当前行列数
cat /etc/passwd | awk '{FS=":"} $3 < 10 {print $1 "\t " $3}' #第一行不变
cat /etc/passwd | awk 'BEGIN {FS=":"} $3 < 10 {print $1 "\t " $3}' #先执行BEGIN

cat pay.txt
Name    1st     2nd     3th
VBird   23000   24000   25000
DMTsai  21000   20000   23000
Bird2   43000   42000   41000

cat pay.txt | awk 'NR==1{printf "%10s %10s %10s %10s %10s\n",$1,$2,$3,$4,"Total" }
NR>=2{total = $2 + $3 + $4
printf "%10s %10d %10d %10d %10.2f\n", $1, $2, $3, $4, total}' #第一行添加Total,其余行计算

cat pay.txt | awk '{if(NR==1) printf "%10s %10s %10s %10s %10s\n",$1,$2,$3,$4,"Total"}
NR>=2{total = $2 + $3 + $4
printf "%10s %10d %10d %10d %10.2f\n", $1, $2, $3, $4, total}' #功能相同判断在动作内
```

`diff`比较文件差异,同一文件新旧版本  
`diff [-bBi] from-file to-file` 参数 -b忽略空白差异 -B忽略空白行差异 -i忽略大小写  也可比较目录 diff /etc/rc3.d/ /etc/rc5.d/  

`cmp file1 file2` 可比较二进制文件 以位组为单位 diff以行为单位  

`patch` 升级还原文件
`patch -pN < patch_file`    <==升级 -p为取消几层目录
`patch -R -pN < patch_file` <==还原 -R为还原

```shell
diff -Naur passwd.old passwd.new > passwd.patch #制作patch文件
patch -p0 < passwd.patch #升级
patch -R -p0 < passwd.patch #还原
```

`pr`加标题与页面 如 pr /etc/man.config  

## shell 脚本

shell script 用在系统管理上面是很好的一项工具,但是用在处理大量数值运算上, 就不够好了,因为 Shell scripts 的速度较慢,且使用的 CPU 资源较多,造成主机资源的分配不良  

shell script 从上到下,从左到右执行;多个空白被忽略;空白行忽略;遇到enter开始执行;`\(enter)`换行;#注释

`下达命令方式` 直接下达(绝对、相对、PATH); bash程序运行 `sh shell.sh` 或 `bash shell.sh`  

### Hello World程序

```shell
#!/bin/bash
# Program:
#       This program shows "Hello World!" in your screen.
# History:
# 2005/08/23    VBird    First release
PATH=/bin:/sbin:/usr/bin:/usr/sbin:/usr/local/bin:/usr/local/sbin:~/bin
export PATH
echo -e "Hello World! \a \n"
exit 0
```

备注:第一行`#!/bin/bash`声明使用的shell名称;注释相关内容;声明环境变量;主要程序;定义回传值

### 务必加注释

功能;版本;作者;历史记录;版权;特殊命令;环境变量  

### 对谈式脚本

使用read -p 'prompt' var

```shell
#!/bin/bash
# Program:
# User inputs his first name and last name.  Program shows his full name.
# History:
# 2005/08/23 VBird First release
PATH=/bin:/sbin:/usr/bin:/usr/sbin:/usr/local/bin:/usr/local/sbin:~/bin
export PATH

read -p "Please input your first name: " firstname  # 提示使用者输入
read -p "Please input your last name:  " lastname   # 提示使用者输入
echo -e "\nYour full name is: $firstname $lastname" # 结果由萤幕输出
```

### 数值加减

declare -i total=20+50 或者 var=$((运算内容))  

### 运行方式差异

- source shell.sh 或者 . shell.sh会把变量内容传回到父shell中
- sh shell.sh 或 -bash shell.sh不会影响父shell变量 export 下传 source 上传  

### test 条件判断

`test -e /dmtsai` 该命令不会有任何输出,需利用返回值  
`test -e /dmtsai && echo "exist" || echo "Not exist"`  
`类型参数` -e存在 -f 文件 -d目录 -b block装置 -c character装置 -S  socket文件 -p pipe文件 -L连接  
`权限参数` -r可读 -w写 -x执行 -uSUID -gSGID -kStricky_bit -s非空  
`比较参数` test file1 -nt file2 参数-nt是否新 -ot是否旧 -ef是否为hard link  
`整数判断` -eq相等 -ne不等 -gt大于 -lt小于 -ge大于等于 -le小于等于  
`字符串` -z是否为0 -n是否非零 str1=str2相等 str1!=str2不等于  
`多重判断` -a和and -o或or !取反  

```shell
#!/bin/bash
# Program:
# User input a filename, program will check the flowing:
# 1.) exist? 2.) file/directory? 3.) file permissions
# History:
# 2005/08/25 VBird First release
PATH=/bin:/sbin:/usr/bin:/usr/sbin:/usr/local/bin:/usr/local/sbin:~/bin
export PATH

# 1. 让使用者输入档名，并且判断使用者是否真的有输入字串？
echo -e "Please input a filename, I will check the filename's type and \
permission. \n\n"
read -p "Input a filename : " filename
test -z $filename && echo "You MUST input a filename." && exit 0
# 2. 判断文件是否存在？若不存在则显示信息并结束脚本
test ! -e $filename && echo "The filename '$filename' DO NOT exist" && exit 0
# 3. 开始判断文件类型与属性
test -f $filename && filetype="regulare file"
test -d $filename && filetype="directory"
test -r $filename && perm="readable"
test -w $filename && perm="$perm writable"
test -x $filename && perm="$perm executable"
# 4. 开始输出资讯！
echo "The filename: $filename is a $filetype"
echo "And the permissions are : $perm"
```

### 判断符号[] 常常用在if判断中  

参数和test一样 [ -z "$HOME" ] ; echo $? 注意[ ]中前后要有空格 参数和判断符号之间也要有  -a -o连接两个表达式  

```shell
name="VBird Tsai"
[ $name == "VBird" ] #用法错误,因为判断式会变成[ VBird Tsai == "VBird" ] 变成三个数据了
```

```shell
#!/bin/bash
# Program:
#  This program shows the user's choice
# History:
# 2005/08/25 VBird First release
PATH=/bin:/sbin:/usr/bin:/usr/sbin:/usr/local/bin:/usr/local/sbin:~/bin
export PATH

read -p "Please input (Y/N): " yn
[ "$yn" == "Y" -o "$yn" == "y" ] && echo "OK, continue" && exit 0
[ "$yn" == "N" -o "$yn" == "n" ] && echo "Oh, interrupt!" && exit 0
echo "I don't know what your choice is" && exit 0
```

shell中的形参 $0命令 $1 第一个参数 $2 第二个参数 ...  
$# 参数格式 $@ `"$1" "$2" "$3" "$4"` $* `"$1 $2 $3 $4"` 一般使用$@ shift n左侧移除n个变量,默认1  

### if语句

```shell
if [ 条件判断式一 ]; then
 当条件判断式一成立时，可以进行的命令工作内容；
elif [ 条件判断式二 ]; then
 当条件判断式二成立时，可以进行的命令工作内容；
else
 当条件判断式一与二均不成立时，可以进行的命令工作内容；
fi
```

例子

```shell
#!/bin/bash
# Program:
#       This program shows the user's choice
# History:
# 2005/08/25    VBird   First release
PATH=/bin:/sbin:/usr/bin:/usr/sbin:/usr/local/bin:/usr/local/sbin:~/bin
export PATH

read -p "Please input (Y/N): " yn

if [ "$yn" == "Y" ] || [ "$yn" == "y" ]; then
 echo "OK, continue"
elif [ "$yn" == "N" -o "$yn" == "n" ]; then
 echo "Oh, interrupt!"
else
 echo "I don't know what your choice is"
fi
```

### case语句  

很多系统服务都这样写,后接参数

```shell
case  $变量名称 in   <==关键字为 case ，还有变量前有钱字号
  "第一个变量内容")   <==每个变量内容建议用双引号括起来，关键字则为小括号 )
    程序段
    ;;            <==每个类别结尾使用两个连续的分号来处理！
  "第二个变量内容")
    程序段
    ;;
  *)                  <==最后一个变量内容都会用 * 来代表所有其他值
    不包含第一个变量内容与第二个变量内容的其他程序运行段
    exit 1
    ;;
esac                  <==最终的 case 结尾！『反过来写』思考一下！
```

例子

```shell
#!/bin/bash
# Program:
#     Show "Hello" from $1.... by using case .... esac
# History:
# 2005/08/29    VBird    First release
PATH=/bin:/sbin:/usr/bin:/usr/sbin:/usr/local/bin:/usr/local/sbin:~/bin
export PATH

case $1 in
  "hello")
    echo "Hello, how are you ?"
    ;;
  "")
    echo "You MUST input parameters, ex> {$0 someword}"
    ;;
  *)   # 其实就相当於万用字节，0~无穷多个任意字节之意！
    echo "Usage $0 {hello}"
    ;;
esac
```

### function函数  

变量与shell类似 函数名$0 变量$1 $2 ...

```shell
function fname() { #function可不写
    程序段
}
```

例子

```shell
#!/bin/bash
# Program:
#    Use function to repeat information.
# History:
# 2005/08/29    VBird    First release
PATH=/bin:/sbin:/usr/bin:/usr/sbin:/usr/local/bin:/usr/local/sbin:~/bin
export PATH

function printit(){
    echo "Your choice is $1"   # 这个 $1 必须要参考底下命令的下达
}

echo "This program will print your selection !"
case $1 in
  "one")
    printit 1  # 请注意， printit 命令后面还有接参数！
    ;;
  "two")
    printit 2
    ;;
  "three")
    printit 3
    ;;
  *)
    echo "Usage $0 {one|two|three}"
    ;;
esac
```

### while循环 条件不成立终止 unitl条件成立终止

```shell
# while循环
while [ condition ]  <==中括号内的状态就是判断式
do            <==do 是回圈的开始！
    程序段落
done          <==done 是回圈的结束

#until循环
until [ condition ]
do
    程序段落
done
```

例子

```shell
#!/bin/bash
# Program:
#    Repeat question until user input correct answer.
# History:
# 2005/08/29    VBird    First release
PATH=/bin:/sbin:/usr/bin:/usr/sbin:/usr/local/bin:/usr/local/sbin:~/bin
export PATH

while [ "$yn" != "yes" -a "$yn" != "YES" ] #相当于until [ "$yn" == "yes" -o "$yn" == "YES" ]
do
    read -p "Please input yes/YES to stop this program: " yn
done
echo "OK! you input the correct answer."
```

### for循环

```shell
#for in 其中in后的参数可以是dog cat elephant写好的;也可以是命令产生的如$(cut -d ':' -f1 /etc/passwd) ;也可以是序列 $(seq 1 100) 或$(1..100)
for var in con1 con2 con3 ...
do
    程序段
done

#for(;;)
for (( 初始值; 限制值; 运行步阶 ))
do
    程序段
done
```

例子

```shell
#!/bin/bash
# Program:
#     Using for .... loop to print 3 animals
# History:
# 2005/08/29    VBird    First release
PATH=/bin:/sbin:/usr/bin:/usr/sbin:/usr/local/bin:/usr/local/sbin:~/bin
export PATH

for animal in dog cat elephant
do
    echo "There are ${animal}s.... "
done
```

```shell
#!/bin/bash
# Program:
#     Try do calculate 1+2+....+${your_input}
# History:
# 2005/08/29    VBird    First release
PATH=/bin:/sbin:/usr/bin:/usr/sbin:/usr/local/bin:/usr/local/sbin:~/bin
export PATH

read -p "Please input a number, I will count for 1+2+...+your_input: " nu

s=0
for (( i=1; i<=$nu; i=i+1 ))
do
    s=$(($s+$i))
done
echo "The result of '1+2+3+...+$nu' is ==> $s"
```

### bug调试  

`sh [-nvx] scripts.sh` 参数 -n仅检查语法问题 -v将内容先输出到荧幕 -x将使用到的输出到荧幕命令前会有+号,调试常用

```shell
# 打印ascii码表  
alias ascii="awk 'BEGIN{H=19;for(n=0;n<H;n++){for(m=0;m<=4;m++){if(n==0){h=h\"\x1b[1;31mC \x1b[37m:\x1b[36mOct\x1b[37m:\x1b[35mHex\x1b[37m:\x1b[33mDec\x1b[m  \";l=l\"================\"}c=32+n+m*H;p=p sprintf(\"\x1b[1;31m%c \x1b[37m:\x1b[36m%03o\x1b[37m:\x1b[35m%2Xh\x1b[37m:\x1b[33m%-3d\x1b[m  \",c,c,c,c)}if(n==0)print h\"\n\"l;print p;p=\"\"}}'"  
```

## 账号管理

输入账号的过程

1. 先找/etc/passwd中是否有帐号，有则读出UID/GID,其中GID在/etc/group中,同时还有家目录与shell配置
2. 核对口令,在/etc/shadow中
3. 如果正确则shell掌控

/etc/passwd 中的数据说明  
head -n 1 /etc/passwd
root:x:0:0:root:/root:/bin/bash
账户名称:口令:UID:GID:用户信息栏:家目录:shell

1. 帐号名称:用来查找UID
1. 口令:早期在此,后因安全放入/etc/shadow所以为x
1. UID:user id 其中0系统管理员 1-499系统帐号,一般不可登录 500-65535一般使用者(早已超过此限制)
1. GID:group id在/etc/group中
1. 用户信息说明栏:解释帐号,可用finger查看chfn修改
1. 家目录:登录之后的家目录
1. shell:用于沟通的shell

/etc/shadow 中的数据说明
head -n 1 /etc/shadow
root:$1$/30QpE5e$y9N/D0bh6rAACBEz.hqo00:14126:0:99999:7:::
帐户名称:口令:最近改动日期:不可变动日期:需变更日期:警告日期:宽限日期:失效日期:保留

1. 帐号名称:与/etc/group对应
1. 口令:加密后的密码$1$表示加密类型,其中MD5加密,$2$Blowfish,$5$SHA-256,$6$SHA-512,!!表示过期,*代表锁定,/30QpE5e为加密盐
1. 最近改动日期:和1970/01/01相比的天数
1. 不可变动日期:改动之后多久不能再改
1. 需变更日期:改动之后多久需要再改
1. 警告日期:变更前警告
1. 宽限日期:变更日期多久之后还能用,但登陆之后要求更改
1. 失效日期:强制失效,可用在收费系统中
1. 保留:暂时没有功能

例子
dmtsai:$1$vyUuj.eX$omt6lKJvMcIZHx4H7RI1V.:14299:5:60:7:5:14419:
用户为dmtasi;加密类型为MD5,加密盐vyUuj.eX,之后是密码密文;最近一次修改密码日期2009/02/24(1970/01/01 +14299天);之后5天不可修改(2009/03/01);需变更日期14299+60=14359即2009/04/25;警告日期7天2009/04/19-2009/04/25,即14299-60-7;如果2009/04/25没有改密码,2009/04/30之前还可登录主机,不过强制改密码,如果改了变动日期就重新计算;不论怎么改14419之后就过期

群组
/etc/group 中的数据说明
head -n 1 /etc/group
root:x:0:root
组名:群组口名:GID:支持的帐号

1. 组名:群组名称
1. 群组口名:群组的口令,移到/etc/gshadow
1. GID:group id
1. 支持的帐号:群组支持的帐号,多个逗号分隔,如root,dmtasi

有效群组
由于一个帐号可以加入多个群组,所以当前的群组为有效群组
/etc/passwd中的GID为初始群组,可以使用`usermod -G users dmtasi`配置次要群组,这样/etc/group的users就增加了demasi
`groups`可查看当前用户加入的群组,其中第一个是有效群组,touch txt的时候创建txt的group,可以使用newgrp切换,如`newgrp users`

/etc/gshadow 中的数据说明
head -n 1 /etc/gshadow
root:::root
组名:群口令:管理员帐号:支持的帐号

群口令:!开头证明不合法

### 帐号管理

useradd 新增用户
useradd [-u UID] [-g 初始群组] [-G 次要群组] [-mM] [-c 说明栏] [-d 家目录绝对路径] [-s shell] 使用者账号名
参数:-u后跟UID -g初始化群组/etc/passwd -G支持群组/etc/group -M不创建家目录 -m创建家目录,默认 -c说明栏 -d指定家目录 -r系统帐号,默认无家目录不可登录,在/etc/login.defs配置 -s默认shell -e失效日期 -f/etc/shadow第七个字段,0立刻失效,-1永不失效

useradd lautumn创建一般帐号

- 在 /etc/passwd 里面创建一行与账号相关的数据，包括创建 UID/GID/家目录等；
- 在 /etc/shadow 里面将此账号的口令相关参数填入，但是尚未有口令；
- 在 /etc/group 里面加入一个与账号名称一模一样的组名；
- 在 /home 底下创建一个与账号同名的目录作为用户家目录，且权限为 700

useradd -r lautumn2创建系统帐号,uid,gid小于500,不会创建家目录

useradd参考文档 useradd -D显示 GROUP默认群组,HOME路径,INACTIVE口令失效日期-1不失效,EXPIRE帐号失效日期,SHELL默认路径,SKEL家目录参考数据,CREATE_MAIL_SPOOL是否主动创建mail
除此文档,还有/etc/login.defs 密码失效日期,uid取值范围,默认家目录的umask,加密类型,是否创建家目录等信息

passwd 配置密码
新创建的用户不配置密码不可使用,`passwd lautumn`修改lautumn的密码,passwd修改自己的密码
passwd [--stdin] 从输入流中读取密码,所有人可用
passwd [-l] [-u] [--stdin] [-S] [-n 日数] [-x 日数] [-w 日数] [-i 日期] 账号 仅root可用 参数-l锁定 -u解锁 -S显示shadow信息 -n多久不可修改 -x多久必改 -w警告天数 -i口令失效天数
echo "abc543CC" | passwd --stdin lautumn  
修改密码 会留在shell历史中~/.bash_history中

chage修改密码日期  比passwd修改日期详细  
chage [-ldEImMW] 账号名 参数 -l列出详情 -d 三 修改最近日期 YYYY-MM-DD -E 八 修改帐号失效日期YYYY-MM-DD,-I 七 口令失效日期,-m 四 不可更改日期,-M 五 多久必须更改,-W 六 警告日期
chage -d 0 lautumn 可让lautumn第一次登录即要更改密码  

usermod 账户修改
usermod [-cdegGlsuLU] username 参数 -c第五栏说明 -d家目录 -e帐号失效日,第八YYYY-MM-DD -f口令失效日,第七 -g初始群组 -G次要群组 -a与-G可用原基础上添加 -l修改名称第一栏 -sshell路径 -uUID -L冻结 -U解冻  

userdel 账户删除
userdel [-r] username 参数-r连目录也删除 如果要完整删除 可先`find / -user username`然后删除

用户功能
finger查看信息
finger [-s] username 参数 -s仅列出用户的账号、全名、终端机代号与登陆时间等等  
chfn change finger修改finger信息
chfn [-foph] [账号名] 参数-f  ：后面接完整的大名；-o  ：您办公室的房间号码；-p  ：办公室的电话号码；-h  ：家里的电话号码！ 一般用不到

chsh 修改shell
chsh [-ls] 参数 -l列出shell -s配置shell

id 查询UID与GID
id [username]

管理群组
group 新增群组
groupadd [-g gid] [-r] 组名 参数 --g指定GID -r系统群组

groupmod 修改群组
groupmod [-g gid] [-n group_name] 群组名 参数-g修改GID -n修改名称 不要随意改

groupdel 删除群组

gpasswd 群组管理员
root用法
gpasswd groupname
gpasswd [-A user1,...] [-M user3,...] groupname
gpasswd [-rR] groupname
参数 -A管理员 -M加入用户 -r移除口令 -R口令失效

管理员用法
gpasswd [-ad] user groupname 参数-a添加 -d删除

权限管理问题
如果project目录为gp群组,权限为2770,用户A不是gp中的成员,想看project中的内容,但是不可修改,如果将文件的权限提升2775,则用户B也可查看了,不可做到细部控制
权限细部规划 ACL Access Control List 可以针对用户和群组进行细部控制  
mount -o remount,acl 加入acl功能 也可修改 /etc/fstab 改为default,acl

setfacl设置
getfacl查看

setfacl [-bkRd] [{-m|-x} acl参数] 目标文件名 参数-m配置参数 -x删除参数 -b移除所有 -k移除默认 -R递归配置 -d配置默认
setfacl -m u:vbird1:rx acl_test1 其中u:使用者:权限  

getfacl filename 查看权限 其中mask为最高权限

用户身份切换
使用一般者操作,避免出错;安全;软件本身限制,如telnet不允许root登录
su - [username]  Substitute User替代用户 参数-l - 重新读取参数配置 -c跟command仅执行一次 -m-p使用目前的环境配置
sudo [-b] [-u 新使用者账号] 参数-b背景执行 -u切换的使用者,无-u为root  要保证用户有新用户的使用权限,且新用户有执行命令的权限,第一次要输入口令,root不用
visudo 修改/etc/sudoers 配置sudo的用户及权限,退出可校验
用户群组     登录者来源主机=(可切换身份)   可下达命令
root        ALL=(ALL)                   ALL
%wheel      ALL=(ALL)                   ALL
%wheel      ALL=(ALL)                   NOPASSWD: ALL
其中%代表群组,NOPASSWD不需要密码

限制操作
myuser1 ALL=(root)  /usr/bin/passwd
可使用root权限运行passwd,但 sudo passwd是修改root密码,可进一步进行限制
myuser1 ALL=(root)  !/usr/bin/passwd, /usr/bin/passwd [A-Za-z]*, !/usr/bin/passwd root
避免输入错误,修改root密码  

设置别名
User_Alias ADMPW = pro1, pro2, pro3, myuser1, myuser2
Cmnd_Alias ADMPWCOM = !/usr/bin/passwd, /usr/bin/passwd [A-Za-z]*, \
                      !/usr/bin/passwd root
ADMPW   ALL=(root)  ADMPWCOM

默认时间间隔5分钟,不用输入密码,可在visudo中修改,Defaults env_reset,timestamp_timeout=20修改为20分钟

sudo 搭配 su 的使用方式,可以用自己的口令变成root,避免root密码泄漏  
User_Alias  ADMINS = pro1, pro2, pro3, myuser1
ADMINS ALL=(root)  /bin/su -

/sbin/nologin提示语句在/etc/nologin.txt中修改  

PAM模块(Pluggable Authentication Modules, 嵌入式认证模块)

passwd呼叫的PAM流程

1. 用户开始运行 /usr/bin/passwd 这支程序，并输入口令；
1. passwd 呼叫 PAM 模块进行验证；
1. PAM 模块会到 /etc/pam.d/ 找寻与程序 (passwd) 同名的配置文件；
1. 依据 /etc/pam.d/passwd 内的配置，引用相关的 PAM 模块逐步进行验证分析；
1. 将验证结果 (成功、失败以及其他信息) 回传给 passwd 这支程序；
1. passwd 这支程序会根据 PAM 回传的结果决定下一个动作 (重新输入新口令或者通过验证！)

```shell
cat /etc/pam.d/passwd
#%PAM-1.0  <==PAM版本的说明而已！
auth       include      system-auth <==每一行都是一个验证的过程
account    include      system-auth
password   include      system-auth
验证类别   控制标准     PAM 模块与该模块的参数
```

第一个字段验证类别 有auth认证 account授权 session会话 password口令修改变更  
有顺序,因为先验证身份,然后授权,配置环境信息,才可修改密码.

第二个字段验证控制旗标
required成功失败均继续 requisite失败中止 sufficient成功中止 optional显示信息

其他相关文件
limits.conf主机使用限制

/var/log/secure, /var/log/messages PAM 模块会记录在secure中

用户传递信息  
w who last lastlog 查询使用者

对谈 write mesg wall
write 使用者账号 [用户所在终端接口] who先查看在线用户,输入信息,使用ctrl+d退出
mesg n 不接受信息,但root发的必须接收
wall广播,所有在线人收到

mail邮件
离线时可用 mail -s 'subject' username 给某人发mail  
mail查看邮件

手动新增使用者
pwck查看/etc/passwd配置的家目录是否有信息
pwconv将/etc/passwd中的口令移到/etc/shadow
pwunconv 移回口令并删除/etc/shadow
chpasswd修改口令 常用参数-m从输入流中读取

批量建账号

```shell
#!/bin/bash
#
# 这支程序主要在帮您创建大量的账号之用，更多的使用方法请参考：
# http://vbird.dic.ksu.edu.tw/linux_basic/0410accountmanager.php#manual_amount
#
# 本程序为鸟哥自行开发，在 CentOS 5.x 上使用没有问题，
# 但不保证绝不会发生错误！使用时，请自行负担风险～
#
# History:
# 2005/09/05    VBird   刚刚才写完，使用看看先～
# 2009/03/04    VBird   加入一些语系的修改与说明，修改口令产生方式 (用 openssl)
export LANG=zh_TW.big5
export PATH=/sbin:/usr/sbin:/bin:/usr/bin
accountfile="user.passwd"

# 1. 进行账号相关的输入先！
echo ""
echo "例如我们昆山四技的学号为： 4960c001 到 4960c060 ，那么："
echo "账号开头代码为         ：4"
echo "账号层级或年级为       ：960c"
echo "号码数字位数为(001~060)：3"
echo "账号开始号码为         ：1"
echo "账号数量为             ：60"
echo ""
read -p "账号开头代码 ( Input title name, ex> std )======> " username_start
read -p "账号层级或年级 ( Input degree, ex> 1 or enter )=> " username_degree
read -p "号码部分的数字位数 ( Input \# of digital )======> " nu_nu
read -p "起始号码 ( Input start number, ex> 520 )========> " nu_start
read -p "账号数量 ( Input amount of users, ex> 100 )=====> " nu_amount
read -p "口令标准 1) 与账号相同 2)随机数自定义 ==============> " pwm
if [ "$username_start" == "" ]; then
        echo "没有输入开头的代码，不给你运行哩！" ; exit 1
fi
# 判断数字系统
testing0=$(echo $nu_nu     | grep '[^0-9]' )
testing1=$(echo $nu_amount | grep '[^0-9]' )
testing2=$(echo $nu_start  | grep '[^0-9]' )
if [ "$testing0" != "" -o "$testing1" != "" -o "$testing2" != "" ]; then
        echo "输入的号码不对啦！有非为数字的内容！" ; exit 1
fi
if [ "$pwm" != "1" ]; then
        pwm="2"
fi

# 2. 开始输出账号与口令文件！
[ -f "$accountfile" ] && mv $accountfile "$accountfile"$(date +%Y%m%d)
nu_end=$(($nu_start+$nu_amount-1))
for (( i=$nu_start; i<=$nu_end; i++ ))
do
        nu_len=${#i}
        if [ $nu_nu -lt $nu_len ]; then
                echo "数值的位数($i->$nu_len)已经比你配置的位数($nu_nu)还大！"
                echo "程序无法继续"
                exit 1
        fi
        nu_diff=$(( $nu_nu - $nu_len ))
        if [ "$nu_diff" != "0" ]; then
                nu_nn=0000000000
                nu_nn=${nu_nn:1:$nu_diff}
        fi
        account=${username_start}${username_degree}${nu_nn}${i}
        if [ "$pwm" == "1" ]; then
                password="$account"
        else
                password=$(openssl rand -base64 6)
        fi
        echo "$account":"$password" | tee -a "$accountfile"
done

# 3. 开始创建账号与口令！
cat "$accountfile" | cut -d':' -f1 | xargs -n 1 useradd -m
chpasswd < "$accountfile"
pwconv
echo "OK！创建完成！"


```

批量删帐号

```shell
#!/bin/bash
usernames=$(cat user.passwd | cut -d ':' -f 1)
for username in $usernames
do
    echo "userdel -r $username"
    userdel -r $username
```

## 文件系统管理

Quota磁碟配额
由于多人环境,如果一个人用的磁盘太多其他人可用的资源就少了,所以可通过quota进行配置
要求:仅能针对filesystem,核心必须支持quota,quota记录文件的变化以前quota.user,quota.group;现在aquota.user,aquota.group;只针对一般使用者  
可配置的项目 block inode
限制级别 soft hard
倒计时天数 grace time 到了soft之后,如果过了grace time就不能再增加文件了

添加系统支持
mount -o remount,userquota,grpquota /home 其中/home为单独的文件系统  
也可修改/etc/fstab ,然后mount -a重新挂载
LABEL=/home   /home  ext3   defaults,usrquota,grpquota  1 2

创建记录文件
quotacheck [-avugfM] [/mount_point] 参数-a扫描/etc/mtab 支持的quota的filesystem -u针对使用情况创建aquota.user -g创建aquota.group -v显示过程 -f强制扫描 -M强制读写  
一般使用 quotacheck -avug 即可

启动quota服务
quotaon [-avug]
quotaon [-vug] [/mount_point]

关闭quota服务
quotaoff [-a] 全部关闭
quotaoff [-ug] [/mount_point]

edquota ：编辑帐号/群组的限值与宽限时间
edquota [-u username] [-g groupname]
edquota -t  <==修改宽限时间
edquota -p 范本帐号 -u 新帐号

显示限制值
quota [-uvs] [username]
quota [-gvs] [groupname]
参数-s 以1024为单位加M

repquota -a [-vugs]显示所有用户情况

warnquota ：对超过限额者发出警告信 可配合定时任务执行  
通过mail发送可修改/etc/warnquota.conf中的模版  不适合/var/spool/mail也在爆表的quota管理中  

setquota直接配置限额,不用进入edquota的管理界面,时候shell脚本  
setquota [-u|-g] 名称 block(soft) block(hard) inode(soft) inode(hard) 文件系统  
setquota -u myquota5 100000 200000 0 0 /home

RAID磁盘阵列 容错式廉价磁盘阵列(Redundant Arrays of Inexpensive Disks, RAID)  
RAID-0 (等量模式, stripe)：效能最佳,至少两个
RAID-1 (映射模式, mirror)：完整备份,至少两个
RAID 0+1，RAID 1+0 结合两个的有点
RAID 3: 一块单独的盘做校验盘,可坏一块,但校验盘的读写频率太高
RAID 5：校验值每次取在不同的硬盘,效能与数据备份的均衡考量,可坏一块
RAID 6:通过算法校验码分散在两块硬盘,可坏两块

| RAID级别 | 冗余磁盘 | 空间利用率 | 性能 | 可靠性 |
|----------|----------|------------|------|--------|
| 0        | 0颗      | 100%       | 最高 | 最低   |
| 1        | n/2颗    | 50%        | 低   | 最高   |
| 3        | 1颗      | (n-1)/n    | 较高 | 较低   |
| 5        | 1颗      | (n-1)/n    | 较高 | 较低   |
| 6        | 2颗      | (n-2)/n    | 较低 | 较高   |

优点:

- 数据安全与可靠性：指的并非资讯安全，而是当硬件 (指磁碟) 损毁时，数据是否还能够安全的救援或使用之意；
- 读写效能：例如 RAID 0 可以加强读写效能，让你的系统 I/O 部分得以改善；
- 容量：可以让多颗磁碟组合起来，故单一文件系统可以有相当大的容量。

software, hardware RAID  
硬件磁盘阵列并不会重复消耗原本系统的 I/O 汇流排,性能好,但贵  
linux下可用mdadm套件模拟RAID

mdadm
mdadm --detail /dev/md0
mdadm --create --auto=yes /dev/md[0-9] --raid-devices=N  --level=[015] --spare-devices=N /dev/sdx /dev/hdx...
参数 --create ：为创建 RAID --auto=yes ：决定创建后面接的软件磁盘阵列装置，亦即 /dev/md0, /dev/md1... --raid-devices=N ：使用几个磁碟 (partition) 作为磁盘阵列的装置 --spare-devices=N ：使用几个磁碟作为备用 (spare) 装置 --level=[015] ：配置这组磁盘阵列的等级。支持很多，不过建议只要用 0, 1, 5 即可 --detail ：后面所接的那个磁盘阵列装置的详细资讯

最好大小一样
mdadm --create --auto=yes /dev/md0 --level=5 --raid-devices=4 --spare-devices=1 /dev/hda{6,7,8,9,10}
mdadm --detail /dev/md0
cat /proc/mdstat
mkfs -t ext3 /dev/md0 格式化
mkdir /mnt/raid
mount /dev/md0 /mnt/raid 挂载
df查看

模拟救援
mdadm --manage /dev/md[0-9] [--add 装置] [--remove 装置] [--fail 装置]  
mdadm --manage /dev/md0 --fail /dev/hda8
mdadm --detail /dev/md0  
cat /proc/mdstat

移除错误磁盘
 mdadm --manage /dev/md0 --add /dev/hda11 --remove /dev/hda8

自动挂载
mdadm --detail /dev/md0 | grep -i uuid # 查看uuid
vi /etc/mdadm.conf #配置 ARRAY /dev/md0 UUID=7c60c049:57d60814:bd9a77f1:57e49c5b
在/etc/fstab中加入md0 /dev/md0    /mnt/raid    ext3    defaults     1 2
mount -a挂载 df /mnt/raid 查看

关闭RAID
umount /dev/md0
vi /etc/fstab ~~/dev/md0    /mnt/raid     ext3    defaults      1 2~~ 删除
mdadm --stop /dev/md0 关闭 --stop /dev/md0
cat /proc/mdstat 查看状态
vi /etc/mdadm.conf 删除 ~~ARRAY /dev/md0 UUID=7c60c049:57d60814:bd9a77f1:57e49c5b
~~

LVM 逻辑卷轴管理员 (Logical Volume Manager)  
可以弹性调整的filesystem  
概念
Physical Volume, PV, 实体卷轴 system id 8e  
Volume Group, VG, 卷轴群组
Pysical Extend, PE, 实体延伸区块
Logical Volume, LV, 逻辑卷轴

图片示意图  
![lvm](image/lvm-arch.png)  
![lvm](image/lvm.gif)

默认线性模式 (linear)：一个用完一个用;交错模式 (triped)：像raid0,一份数据拆成几份  

pv阶段
pvscan
pvcreate /dev/hda{6,7,8,9}
pvdisplay

VG阶段
vgcreate [-s N[mgt]] VG名称 PV名称 参数-s后面接 PE 的大小 (size) ，单位可以是 m, g, t (大小写均可)
vgcreate -s 16M vbirdvg /dev/hda{6,7,8}
vgscan
pvscan
vgdisplay
vgextend vbirdvg /dev/hda9 添加
vgdisplay

LV阶段
lvcreate [-L N[mgt]] [-n LV名称] VG名称 -L跟容量单位 M,G,T,必须是PE的倍数
lvcreate [-l N] [-n LV名称] VG名称 -l PE个数,后面接的就是 -n LV,的名称啦！
lvcreate -l 356 -n vbirdlv vbirdvg
ll /dev/vbirdvg/vbirdlv
lvdisplay

文件系统阶段
mkfs -t ext3 /dev/vbirdvg/vbirdlv 格式化
mkdir /mnt/lvm  
mount /dev/vbirdvg/vbirdlv /mnt/lvm 挂载

放大容量
pvcreate /dev/hda10
pvscan
vgextend vbirdvg /dev/hda10 放大
vgdisplay 查看vg
lvdisplay 查看lv
dumpe2fs /dev/vbirdvg/vbirdlv 查看文件系统信息
resize2fs [-f] [device] [size] 修改文件系统大小 参数-f强制 size参数M,G不跟即使全部

减小容量
pvdisplay 查看要减小物理分区的大小
pvscan 检查大小
resize2fs /dev/vbirdvg/vbirdlv 6900M 查看后重新分配
umount /mnt/lvm卸载
lvresize -l -89 /dev/vbirdvg/vbirdlv 减小lv容量
lvdisplay
pvdisplay
pvmove /dev/hda6 /dev/hda10  
vgreduce vbirdvg /dev/hda6 移除hda6
pvscan
pvremove /dev/hda6 使hda6不在是pv

还可利用lvm建快照系统

常用命令  
| 任务                | PV 阶段   | VG 阶段   | LV 阶段             |
|---------------------|-----------|-----------|---------------------|
| 搜寻(scan)          | pvscan    | vgscan    | lvscan              |
| 创建(create)        | pvcreate  | vgcreate  | lvcreate            |
| 列出(display)       | pvdisplay | vgdisplay | lvdisplay           |
| 添加(extend)        | 　        | vgextend  | lvextend (lvresize) |
| 减少(reduce)        | 　        | vgreduce  | lvreduce (lvresize) |
| 删除(remove)        | pvremove  | vgremove  | lvremove            |
| 改变容量(resize)    | 　        | 　        | lvresize            |
| 改变属性(attribute) | pvchange  | vgchange  | lvchange            |

## maven仓库镜像

> 下载工具  

```shell
lftp http://maven.aliyun.com/nexus/content/repositories/central/ -e 'mirror .'
```

## 常用缩写

### 1. 目录缩写

缩写 | 全称 | 说明
--- | --- | --- |
/bin | BINaries | 二进制可执行命令
/dev | DEVices | 特殊设备文件
/etc | ETCetera | 系统管理和配置文件
/etc/fstab | FileSystem TABle | 文件/etc/fstab包含了静态文件系统信息，定义了存储设备和分区整合到整个系统的方式。mount 命令会读取这个文件，确定设备和分区的挂载选项。
/lib | LIBraries | 库文件
/mnt | MouNT | 系统提供这个目录是让用户临时挂载其他的文件系统。
/opt | OPTion | 第三方软件放置的目录。如果你想自行安装额外的软件(非原本的 distribution 提供的)，那么也能够将你的软件安装到这里来。
/proc | PROCesses | 虚拟的目录，是系统内存的映射。可直接访问这个目录来获取系统信息。
/sbin | Super BINaries, Superuser BINaries | 系统管理命令，这里存放的是系统管理员使用的管理程序
/srv | SeRVices | 是一些网络服务启动后，这些服务所需要取用的数据目录。常见的服务例如 WWW，FTP 等。
/sys | SYStem | 虚拟文件系统，主要记录与内核相关的信息，包括目前已加载的内核模块与内核检测到的硬件设备信息，同样不占硬盘容量。
/tmp | TeMPorary | 公用的临时文件存储点
tty | teletypewriter | “电传打字机”，在类Unix里，键盘显示器，都是虚拟的teletypewriter
/usr | Unix System/Software/Shared Resources | “Unix 操作系统软件资源” 所放置的目录，不是用户数据。 FHS 建议所有的软件开发者应该将他们的数据合理的放置到这个目录下的子目录，而不是自行新建该软件自己独立的目录。
/var | VARiable | 某些大文件的溢出区，比方说各种服务的日志文件

注：具体到各个目录的功能以及作用，可以参考下面两篇文章：

- [Linux中常用的命令都是哪些单词的缩写？](https://www.zhihu.com/question/49073893)
- [(转)linux 目录结构及其含义](http://www.cnblogs.com/zhyryxz/archive/2012/05/03/2480242.html)(这篇比较详细)

### 2. 命令缩写

缩写 | 全称 | 说明
--- | --- | ---
apt | Advanced Packaging Tool | 是Debian Linux发行版中的APT软件包管理工具。一般配合apt-get或者apt-update
awk | Aho Weiberger and Kernighan | Alfred Aho，Peter Weinberger, 和 Brian Kernighan 的Family Name的首字符。一种编程语言，用于在linux/unix下对文本和数据进行处理。
bash | Bourne Again SHell | 一种shell
bg | BackGround | 用于将作业放到后台运行，使前台可以执行其他任务。该命令的运行效果与在指令后面添加符号&的效果是相同的，都是将其放到系统后台执行。
cal | CALendar | 用于显示当前日历，或者指定日期的日历。
cat | CATenate | "连接"，连接文件并打印到标准输出设备上，cat经常用来显示文件的内容，类似于下的type命令。
chgrp | CHange GRouP | 用来改变文件或目录所属的用户组。
chmod | CHange MODe | 用来变更文件或目录的权限。
chown | CHange OWNer | 改变某个文件或目录的所有者和所属的组，该命令可以向某个用户授权，使该用户变成指定文件的所有者或者改变文件所属的组。
cd | Change Directory | 切换工作目录
cp | CoPy | 将一个或多个源文件或者目录复制到指定的目的文件或目录
dd | Data Description | 用于复制文件并对原文件的内容进行转换和格式化处理。
df | Disk Free | 用于显示磁盘分区上的可使用的磁盘空间。默认显示单位为KB。
du | Disk Usage | 查看使用空间的，但是与df命令不同的是Linux du命令是对文件和目录磁盘使用的空间的查看，还是和df命令有一些区别的。
diff | DIFFerence | 在最简单的情况下，比较给定的两个文件的不同。
dpkg | Debian PacKaGe | Debian Linux系统用来安装、创建和管理软件包的实用工具。
ed | EDitor | 单行纯文本编辑器，它有命令模式（command mode）和输入模式（input mode）两种工作模式。
emacs |  Editor MACroS | 是由GNU组织的创始人Richard Stallman开发的一个功能强大的全屏文本编辑器，它支持多种编程语言，具有很多优良的特性。(备注：vim大法好！！！)
env | ENVironment | 用于显示系统中已存在的环境变量，以及在定义的环境中执行指令。
exec | EXECute | 用于调用并执行指令的命令。
fsck | File System Consistency checK, or fuck | 用于检查并且试图修复文件系统中的错误。
gawk | Gnu Aho Weiberger and Kernighan |
grep | Gnu Regular Expression Print | （global search regular expression(RE) and print out the line，全面搜索正则表达式并把行打印出来）是一种强大的文本搜索工具，它能使用正则表达式搜索文本，并把匹配的行打印出来。
grub | GRand Unified Bootloader | 多重引导程序grub的命令行shell工具。
ifconfig | InterFace CONFIGuration | 被用于配置和显示Linux内核中网络接口的网络参数。
init | INITialization | Linux下的进程初始化工具
insmod | INStall Module | 用于将给定的模块加载到内核中。
ln | LiNk | 用来为文件创件连接，连接类型分为硬连接和符号连接两种，默认的连接类型是硬连接。如果要创建符号连接必须使用"-s"选项。
ls | LiSt | 显示目标列表
lsmod | LiSt Module | 用于显示已经加载到内核中的模块的状态信息。
man | MANual | Linux下的帮助指令，通过man指令可以查看Linux中的指令帮助、配置文件帮助和编程帮助等信息。一般戏称有问题找男人。。。
mkdir | MaKe DIRectory | 创建目录
mkfs | MaKe FileSystem | 用于在设备上（通常为硬盘）创建Linux文件系统。
mv | MoVe | 对文件或目录重新命名，或者将文件从一个目录移到另一个目录中。
nano | Nano's ANOther editor | 是一个字符终端的文本编辑器，有点像DOS下的editor程序。
parted | PARTition EDitor | 是由GNU组织开发的一款功能强大的磁盘分区和分区大小调整工具，与fdisk不同，它支持调整分区的大小。
passwd | PASSWorD | 用于设置用户的认证信息，包括用户密码、密码过期时间等。
ping | Packet InterNet Grouper | 用来测试主机之间网络的连通性。执行ping指令会使用ICMP传输协议，发出要求回应的信息，若远端主机的网络功能没有问题，就会回应该信息，因而得知该主机运作正常。
popd | POP from Directory | 删除目录栈中的记录；
pushd | PUSH to Directory | 是将目录加入命令堆叠中。
ps | Processes Status | 报告当前系统的进程状态。可以搭配kill指令随时中断、删除不必要的程序。
pwd | Print Working Directory | 以绝对路径的方式显示用户当前工作目录
rcconf | Run Command CONFiguration | Debian Linux下的运行等级服务配置工具，用以设置在特定的运行等级下系统服务的启动配置。
rm | ReMove | 可以删除一个目录中的一个或多个文件或目录，也可以将某个目录及其下属的所有文件及其子目录均删除掉。对于链接文件，只是删除整个链接文件，而原有文件保持不变。
rmdir | ReMove DIRectory | 用来删除空目录。
rmmod | ReMove MODule | 用于从当前运行的内核中移除指定的内核模块。
rpm | RPM/Redhat Package Manager | RPM软件包的管理工具。
sed | Stream EDitor | 一种流编辑器，它是文本处理中非常中的工具，能够完美的配合正则表达式使用，功能不同凡响。
ssh | Secure SHell | openssh套件中的客户端连接工具，可以给予ssh加密协议实现安全的远程登录服务器。
su | Substitute User | "替代用户"，切换当前用户身份到其他用户身份，变更时须输入所要变更的用户帐号与密码。
sudo | SuperUser DO | 用来以其他身份来执行命令，预设的身份为root。
sync | SYNChronize | 用于强制被改变的内容立刻写入磁盘，更新超块信息。
vim | vi Improved | 是UNIX操作系统和类UNIX操作系统中最通用的全屏幕纯文本编辑器。Linux中的vi编辑器叫vim，它是vi的增强版（vi Improved），与vi编辑器完全兼容，而且实现了很多增强功能。(备注：神一样的编辑器！！！)
yum | Yellow dog Updater, Modified | 在Fedora和RedHat以及SUSE中基于rpm的软件包管理器

注：命令的具体解释可以参考这个网站：[Linux命令大全](http://man.linuxde.net/)_Linux常用命令行实例详解_Linux命令学习手册)

### 3. 编程相关缩写

缩写 | 全称 | 说明
--- | --- | ---
cc | C Compiler |
gcc | Gnu Compiler Collection | 作为一个软件集被你下载下来编译安装的时候
gcc | Gnu C Compiler | 作为一个软件被你调用来编译C程序的时候
g++ | Gnu c++ compiler | 其实g++只是调用gcc，然后连接c++的库，并且作相应的一些编译设置而已
gcj | Gnu Compiler for Java |
gdb | Gnu DeBug |

### 4. 递归缩写

缩写 | 全称 | 说明
--- | --- | ---
GNU | Gnu is Not Unix |
PHP | PHP: Hypertext Preprocessor |
RPM | RPM Package Manager |
WINE | WINE Is Not an Emulator | Wine 是类UNIX系统下运行微软Windows程序的"兼容层"。在Wine中运行的Windows程序，就如同运行原生Linux程序一样，不会有模拟器那样的性能问题。
PNG | PNG's Not GIF |
nano | Nano's ANOther editor |

### 5. 其他缩写

缩写 | 全称 | 说明
--- | --- | ---
tar | Tape Archive | “磁带档案卷”
tcl | Tool Command Language | Tcl（发音 tickle）是一种脚本语言。
tty | teletypewriter | “电传打字机”，在类Unix里，键盘显示器，都是虚拟的teletypewriter
tzselect |  Time Zone SELECT |

### 6. 参考资料

- [Linux中常用的命令都是哪些单词的缩写？](https://www.zhihu.com/question/49073893)
- [(转)linux 目录结构及其含义](http://www.cnblogs.com/zhyryxz/archive/2012/05/03/2480242.html)
- [Linux命令大全](http://man.linuxde.net/)
- [Wine (简体中文)](https://wiki.archlinux.org/index.php/Wine_(%E7%AE%80%E4%BD%93%E4%B8%AD%E6%96%87))
- [fstab (简体中文)](https://wiki.archlinux.org/index.php/Fstab_(%E7%AE%80%E4%BD%93%E4%B8%AD%E6%96%87))
- [AWK 简明教程](http://coolshell.cn/articles/9070.html)
- [缩写习惯](http://i.linuxtoy.org/docs/guide/ch02s02.html)
- [Tcl](https://zh.wikipedia.org/wiki/Tcl?oldformat=true)
- [Unix Command Acronyms](http://www.abbreviations.com/acronyms/UNIX)
- [Linux常用缩写](http://blog.wangmingkuo.com/abbreviation-in-linux/)
