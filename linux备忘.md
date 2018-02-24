# linux 学习

## 经典语句

> 在Windows里面,设定不好设备,您可以骂它;在Linux里面,如果设定好设备了,您得要感激它!  
> 没有安装过Linux十次以上,不要说你学会了Linux了啦!慢慢体会这句话吧! ^_^

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

uname -sr 系统核心版本

date 当前日期 date  
cal 日历  
bc 计算器 默认整数 scale=3 保留三位有效数字 quit退出  
exit 退出 ctrl+d  
man [command] 查找命令用法/ [command] --help 相似

**关机**  
sync>shutdown or reboot 注意 shutdown 加时间只会结束服务,加上-h会在结束服务后立刻关机 shutdown会发提示关机命令给所有在线用户  

cat << EOF(定义结束符)  
first  
second  
EOF

useradd [username] 增加用户  
passwd [username] 修改口令/不加口令则该自己  
chage -d 0 [username] 强制用户登陆一次之后改密码  
echo "password" | passwd --stdin [username] 用命令给用户改密码不用两次输入  

which [command] 命令在哪儿  

## 常见问题

### Determining IP information for eth0...failed 错误解决

> VMware dhcp服务没有开  
uname -r 内核版本  
lsb_release -a  LSB (Linux Standard Base) and Distribution   information

## linux 安装

### basic server 安装时默认没有开启eth0网卡  

> 将eth0中的onboot设置改为yes /etc/sysconfig/network-scripts/ifcfg-eth0中的设置更改 更改完成后 service network restart  
单次更改可以改为ifup eth0  
centos7中取消ifconfig命令 可安装net-tools 或者使用ip addr  

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

chgrp [-R] GROUP FILE  
chown [-R] OWNER:GROUP FILE  
chmode [[u/g/o/a] [+/-/=] [rwx]] file 例子 chmod  u=rwx,go=rx  .bashrc 与chmod 755 .bashrc一样 chmod  a+w  .bashrc 增加可写权限 chmod 4775 filename 其中4位的第一位表示SUID4/SGID2/SBIT1  
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

**`/usr`**目录下(unix software resource)Unix操作系统软件资源 类似于'C:\Windows\ + C:\Program files\'  
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

`umask` 文件默认权限 文档默认666 文件夹默认777 减去umask值为默认权限 umask 002 修改默认权限  

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

## maven仓库镜像

> 下载工具  

```shell
lftp http://maven.aliyun.com/nexus/content/repositories/central/ -e 'mirror .'
```
