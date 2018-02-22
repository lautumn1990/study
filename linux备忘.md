# linux 学习

## 经典语句

> 在Windows里面，设定不好设备，您可以骂它；在Linux里面，如果设定好设备了，您得要感激它！

> 没有安装过Linux十次以上，不要说你学会了Linux了啦！慢慢体会这句话吧！ ^_^

## 硬盘

Linux中的档名

| 装置                | 装置在Linux内的档名                      |
|---------------------|------------------------------------------|
| IDE硬盘机           | /dev/hd[a-d]                             |
| SCSI/SATA/U盘硬盘机 | /dev/sd[a-p]                             |
| U盘快闪碟           | /dev/sd[a-p](与SATA相同)                 |
| 软盘机              | /dev/fd[0-1]                             |
| 打印机              | 25针: /dev/lp[0-2]U盘: /dev/usb/lp[0-15] |
| 鼠标                | U盘: /dev/usb/mouse[0-15]PS2: /dev/psaux |
| 当前CDROM/DVDROM    | /dev/cdrom                               |
| 当前的鼠标          | /dev/mouse                               |
| 磁带机              | IDE: /dev/ht0SCSI: /dev/st0              |

## 常用命令

uname -sr 系统核心版本

date 当前日期 date  
cal 日历  
bc 计算器 默认整数 scale=3 保留三位有效数字 quit退出  
exit 退出 ctrl+d  
man [command] 查找命令用法/ [command] --help 相似

关机  
sync>shutdown or reboot 注意 shutdown 加时间只会结束服务，加上-h会在结束服务后立刻关机 shutdown会发提示关机命令给所有在线用户  

cat << EOF(定义结束符)  
first  
second  
EOF

useradd [username] 增加用户  
passwd [username] 修改口令/不加口令则该自己  
chage -d 0 [username] 强制用户登陆一次之后改密码  
echo "password" | passwd --stdin [username] 用命令给用户改密码不用两次输入  

which [command] 命令在哪儿  

## 变量

LANG  
PATH  
~

## 常见问题

Determining IP information for eth0...failed 错误解决
> VMware dhcp服务没有开
uname -r 内核版本  
lsb_release -a  LSB (Linux Standard Base) and Distribution   information


## linux 安装

basic server 安装时默认没有开启eth0网卡  
解决方法：将eth0中的onboot设置改为yes /etc/sysconfig/network-scripts/ifcfg-eth0中的设置更改 更改完成后 service network restart
单次更改可以改为ifup eth0

## linux 文件

-rwxr-xr-x
含义
> 第一个当为[ d ]则是目录  
当为[ - ]则是文件  
若是[ l ]则表示为连结档(link file)；  
若是[ b ]则表示为装置文件里面的可供储存的接口设备(可随机存取装置)；  
若是[ c ]则表示为装置文件里面的串行端口设备，例如键盘、鼠标(一次性读取装置)。

> rwx 读写运行权限  
> 第一组文件拥有者 第二组同组权限 第三组其他人权限  
> rwx对文件来说是针对内容来讲，r可以读取内容，w可以改写内容，x是可执行文件  
> rwx对文件夹来说，r可读取文件列表，w可增删文件，x可进入文件  

切换文件用户和用户组  
chgrp [-R] GROUP FILE  
chown [-R] OWNER:GROUP FILE  
chmode [[u/g/o/a] [+/-/=] [rwx]] file 例子 chmod  u=rwx,go=rx  .bashrc 与chmod 755 .bashrc一样 chmod  a+w  .bashrc 增加可写权限 chmod 4775 filename 其中4位的第一位表示SUID4/SGID2/SBIT1  
要开放目录给任何人浏览时，应该至少也要给予r及x的权限，但w权限不可随便给；  


[root@www tmp]# 
输入命令为#是root,输入命令$其他

Filesystem Hierarchy Standard (FHS)标准
| 　                 | 可分享的(shareable)          | 不可分享的(unshareable) |
|--------------------|------------------------------|-------------------------|
| 不变的(static)     | /usr   (软件放置处)          | /etc   (配置文件)       |
| 　                 | /opt   (第三方协力软件)      | /boot   (开机与核心档)  |
| 可变动的(variable) | /var/mail   (使用者邮件信箱) | /var/run   (程序相关)   |
| 　                 | /var/spool/news   (新闻组)   | /var/lock   (程序相关)  |

FHS针对目录树架构仅定义出三层目录底下应该放置什么数据而已，分别是底下这三个目录的定义：  
/ (root, 根目录)：与开机系统有关；  
/usr (unix software resource)：与软件安装/执行有关；  
/var (variable)：与系统运作过程有关。  

/ 目录下
/bin 可执行文件目录，单人维护使用
/boot 开机文件目录
/dev 设备device
/etc 配置(et cetra 法语 相当于英语and so on 等等) 其中比较重要/etc/inittab,/etc/init.d,/etc/modprobe.conf,/etc/X11/,/etc/fstab,/etc/sysconfig/
/home 家目录home directory 
/lib 系统函数库
/media 可移除设备 /media/floppy, /media/cdrom
/mnt 暂时挂载
/opt  第三方协力软件放置的目录
/root root家目录
/sbin root命令，开机使用 其他放置在/usr/sbin/ (服务器应用)和 /usr/local/sbin/ (本机自行安装软件产生目录)中
/srv 服务器启动后的数据目录如/srv/www
/tmp 使用者或者程序临时纺织文件的地方
其他
/lost+found ext2/3/4 会产生的目录，系统错误时一些遗失的片段放在此
/proc 虚拟文件系统，放置在内存中 不占硬盘容量 如系统核心、行程信息(process)、周边装置的状态及网络状态
/sys 虚拟的文件系统 记录与核心相关的信息

不可与根目录分开/etc /bin /dev /lib /sbin  

/usr目录下（unix software resource）Unix操作系统软件资源 类似于'C:\Windows\ + C:\Program files\'
/usr/X11R6 x window system重要数据11版第6次
/usr/bin/ 绝大部分用户指令
/usr/include c/c++等语言的include文件
/usr/lib 函数库
/usr/local 本机自行安装的软件建议放置此目录
/usr/sbin 非系统正常运作所需要的指令
/usr/share 共享文件的地方
/usr/src 源码放置的目录

/var 目录含义variable 可变动 主要是常态性变动的文件 如缓存 登录档 软件产生的文件
/var/cache 暂存档
/var/lib 程序执行过程中使用的数据文件 如/var/lib/mysql/
/var/lock 锁定的文件
/var/log 登录文件放置的目录
/var/mail 电子邮件
/var/run/ 存放pid
/var/spool 队列数据

## 目录

. 代表此层目录
.. 代表上一层目录
`-` 代表前一个工作目录
~ 代表『目前使用者身份』所在的家目录
~account 代表 account 这个使用者的家目录(account是个帐号名称)

cd 变换目录 change directory
pwd 显示当前目录 print working directory pwd -P 显示真实路径 非链接
mkdir 创建新目录 -p自动建父目录 -m指定权限
rmdir 删除空目录 -p上一级空目录也删
 
为了安全不建议将.即当前目录加入PATH

文件管理
ls [-aAdfFhilnrRSt] 目录名称 文件与目录检视 
cp [-adfilprsu] 来源档(source) 目标档(destination) 复制 cp -l 硬连接 -s 软连接 i-node
rm [-fir] 文件或目录 删除目录 
mv [-fiu] source destination
basename /a/b/c/123 返回123
dirname /a/b/c/123 返回/a/b/c

文件内容查阅
cat  由第一行开始显示文件内容  cat -n 行号 
tac  从最后一行开始显示，可以看出 tac 是 cat 的倒著写！ 
nl   显示的时候，顺道输出行号！ 更多行号设置更能
more 一页一页的显示文件内容 
less 与 more 类似，但是比 more 更好的是，他可以往前翻页！ 
head 只看头几行 
tail 只看尾巴几行 
od   以二进位的方式读取文件内容！ od -t xCc filename ASCII 与字节的对照表

 touch [-acdmt] 文件 修改文档时间 -a 仅accesstime -c仅修改时间不创建 -d 修改为其他时间 -m mtime -t 修改时间[YYMMDDhhmm]
modification time (mtime)：内容更改时间
status time (ctime)：状态（属性权限）更改时间
access time (atime)：内容获取时间

umask 文件默认权限 文档默认666 文件夹默认777 减去umask值为默认权限 umask 002 修改默认权限    

隐藏属性
chattr 修改文件的隐藏属性 +i不能删除改名修改 +a只能增加不能删除修改
lsattr 显示文件的隐藏属性

特殊权限
SUID, SGID, SBIT
SUID Set UID 运行期间取得拥有者权限
SUID 仅可用在binary program 上， 不能够用在 shell script 上面！和目录上
SBIT Sticky Bit 尽可用于目录，创建者和root用户可对目录内文件有删除更名移动的权限
SUID 4/ SGID 2/ SBIT 1   chmod 4775 filename
大写ST表示没有此权限，因为拥有者用户没有此权限

file filename 观察文件类型

搜索
which [-a] command 命令路径在PATH中找
type command 文件类型
whereis [-bmsu] 文件或目录名 -b binary类型-m manual路径下文件 -s source 来源文件 -u不在以上找
find [PATH] [option] [action] 搜寻硬盘 
时间相关find /tmm -mtime +4/-4/4 含义 +4 大于5天，-4小于四天，4 4-5天 -newer filename  比filename新的文件
用户相关find /home -user lau 找出lau的文件 参数有-uid -gid -user -group  -nouser -nogroup
文件权限与名称相关 -name -size -type [f,b,c,d,l,s,p] -perm mode/+mode/-mode
额外功能 find / -perm +7000 -exec ls -l {} \; 执行额外的命令 -print 打印到萤幕上默认 -a 合并 -o 或者
locate [-ir] keyword 查找-i 忽略大小写 -r 正则写法 从数据库中查找 updatedb 更新数据库

## 硬盘与文件系统

dumpe2fs 装置名称 列出文件系统信息 -h 仅superblock数据 -b 仅坏道
du [-ahskm] 文件或目录名称 所有的文件数据容量  -S 减少目录汇总
df [-ahikHTm] [目录或文件名] 目前挂载的装置 常用-h -a -i

superblock：记录此 filesystem 的整体信息，包括inode/block的总量、使用量、剩余量， 以及文件系统的格式与相关信息等； 
inode：记录文件的属性，一个文件占用一个inode，同时记录此文件的数据所在的 block 号码； CentOS5 128Bytes  CentOS6默认256Byte
block：实际记录文件的内容，若文件太大时，会占用多个 block 。 1k 2k 4k 

索引式文件系统(indexed allocation)。

目录的inode存属性，block存文件名和对应的inode，ls -li 可查看文件名inode号码，目录至少占用一个block不够了再加
文件的inode存属性，block存内容

读取文件步骤
/etc/passwd 读取步骤 先找/的inode 通过挂载点信息找，同时读权限; 然后找/的block找出etc/的inode号码;etc/的block找到passwd的inode;passwd的inode相关权限和block位置;passwd的block读取内容

写入文件步骤
先确定是否在新增目录有wx权限；根据inode bitmap查找空inode,写权限；根据block bitmap找空block,数据写入block，升级inode的block;将inode和block的数据同步到inode bitmap和block bitmap，并更新superblock

不一致状态
写入过程中断电等情况，使用e2fsck程序检查，同时ext3以后增加日志系统，避免全盘扫描

挂载后才可使用
linux通过VFS(Virtual Filesystem Switch)管理文件系统

硬连接与软连接
在inode级别连接是硬链接可以通过ls -li查看
软连接是通过存路径的方式

硬盘分区相关命令
fdisk 装置名称 进行分区 其中m列出命令 p打印更改后的分割表 n增加分区 d删除 w写入 q不保存退出 fdisk无法处理2T以上的数据，可以使用parted命令
mkfs [-t 文件系统格式] 装置文件名 磁盘格式化命令
mke2fs [-b block大小] [-i block大小] [-L 标头] [-cj] 装置 详细配置格式化信息

磁盘检验
fsck [-t 文件系统] [-ACay] 装置名称 检查文件系统是否出错 filesystem check
badblocks -[svw] 装置名称 检查坏道

挂载
mount -a 依照配置文件 /etc/fstab 的数据将所有未挂载的磁盘都挂载上来
mount -l 显示Label 名称
mount [-t 文件系统] [-L Label名] [-o 额外选项] [-n]  装置文件名  挂载点
mount -o remount,rw,auto / 重新挂载根目录
umount [-fn] 装置文件名或挂载点 卸载

e2label 装置名称  新的Label名称 修改label名
tune2fs [-jlL] 装置代号 修改设备信息 -l类似 dumpe2fs -h 的功能 -j带日志 -L修改label

/etc/fstab 启动时的挂载信息 Device/Mount point/filesystem/parameters/dump/fsck
/etc/mtab 实际挂载情况

## 压缩

compress 非常老的压缩程序  默认档名*.Z  
compress [-rcv] 文件或目录  <==这里是压缩  -r连同目录压缩  -c压缩输出到荧幕 -v显示变化  压缩时会删除源文件  compress -c man.config > man.config.back.Z 此种方式可保留源文件
uncompress 文件.Z           <==这里是解压缩  

gzip压缩  使用广泛  默认档名*.gz  
gzip [-cdtv#] 档名  -c输出银幕，配合重定向  -d解压缩 -t检查一致性  -v输入过程  -#等级 -1最快压缩比差 -9最高  
zcat 档名.gz  查看文件列表  zcat类似cat不过只能看文件列表  

bzip2 压缩比高  默认档名*.bz2  
bzip2 [-cdkzv#] 档名  -k保留源文件 -z压缩  bupzip2 等于 bzip2 -d 解压缩
bzcat 档名.bz2  

tar 打包命令 可以把一堆文件打包成一个  默认档名*.tar 压缩后*.tar.gz *.tar.bz2  
tar [-j|-z] [cv] [-f 创建的档名] filename... <==打包与压缩  
tar [-j|-z] [tv] [-f 创建的档名]             <==察看档名  
tar [-j|-z] [xv] [-f 创建的档名] [-C 目录]   <==解压缩  
tar 参数 -c创建打包文件create -t查看文件list -x解压缩解打包extract -j压缩bzip2 -z压缩gzip -v显示过程 -f filename 紧跟要处理的档名 -C directory紧跟目录 -p保留权限属性 -P保留绝对路径 默认相对路径 最好不要用-P --exclude=FILE 不打包文件
例子
> 压　缩：tar -jcv -f filename.tar.bz2 要被压缩的文件或目录名称  
查　询：tar -jtv -f filename.tar.bz2  
解压缩：tar -jxv -f filename.tar.bz2 -C 欲解压缩的目录  
单一文件  tar -jxv -f 打包档.tar.bz2 待解开档名  
tarfile  tar包未压缩  
tarball  tar包压缩  

dump完整备份  
dump [-Suvj] [-level] [-f 备份档] 待备份数据 参数-S需要多少空间 -u记录到/etc/dumpupdates中 -v 显示过程 -j 加入bzip2支持 -level等级 -f 文件名  
dump -W 列出/etc/fstab中的是否有备份  

restore 还原备份  
restore -t [-f dumpfile] [-h]        <==用来察看 dump 档
restore -C [-f dumpfile] [-D 挂载点] <==比较dump与实际文件
restore -i [-f dumpfile]             <==进入互动模式
restore -r [-f dumpfile]             <==还原整个文件系统
参数 -t 查看dump数据 -C比较 -i互动模式 -r还原 -h显示inode与label -f要处理的文件 -D挂载点与-C联用

mkisofs：创建映像档  
cdrecord：光盘烧录工具  

dd 备份整颗 partition 或 整颗 disk  tar备份数据  
dd if="input_file" of="output_file" bs="block_size" count="number"
例子
> 将 /etc/passwd 备份到 /tmp/passwd.back 当中  
dd if=/etc/passwd of=/tmp/passwd.back  

> 将自己的磁碟之第一个磁区备份下来  
dd if=/dev/hdc of=/tmp/mbr.back bs=512 count=1  

cpio 为相当优秀的备份命令

## vim编辑器

三种模式 一般模式，编辑模式，指令行模式（:/?）  
一般模式：移动删除复制粘贴  
编辑模式：输入替换文字  
指令行模式：读取存储搜索等  
一般模式-->编辑模式i/o/a/R 返回esc  
一般模式-->指令行模式:/? 返回esc  
编辑模式与指令行模式不可切换  

指令图片  
![指令1](image/vim-commands.jpg)
![指令2](image/vi-vim-cheat-sheet-sch.gif)

特殊  
区块选择 v字符选择 V行选择 ctrl+v区块选择 y复制 d删除  
多档案 :n 下一个档案 :N上一个档案 :files所有的档案  
多窗口 :sp 分成两个 :sp filename 分两个 ctrl+w +j/↓ 下一个窗口 ctrl+w +k/↑上一个窗口 ctrl+w +q离开  
vim环境设定与记录 ~/.vimrc  ~/.viminfo  
例子
> vim ~/.vimrc  
"这个档案的双引号 (") 是批注  
set hlsearch            "高亮度反白  
set backspace=2         "可随时用退格键删除  
set autoindent          "自动缩排  
set ruler               "可显示最后一行的状态  
set showmode            "左下角那一行的状态  
set nu                  "可以在每一行的最前面显示行号啦！  
set bg=dark             "显示不同的底色色调  
syntax on               "进行语法检验，颜色显示。  

换行符  
linux/unix \n LF  $  
windows \r\n CRLF  ^M$  
Carriage-Return Line-Feed \r=return \n=newline  

dos2unix [-kn] file [newfile]  -k保留mtime -n 保留旧文档 dos2unix -n old new  
unix2dos [-kn] file [newfile]  
iconv  --list  
iconv -f 原本编码 -t 新编码 filename [-o newfile]  

## shell脚本


## maven仓库镜像

> 下载工具  
> lftp http://maven.aliyun.com/nexus/content/repositories/central/ -e 'mirror .'
