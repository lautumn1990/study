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

## 常见问题

Determining IP information for eth0...failed 错误解决
> VMware dhcp服务没有开
uname -r 内核版本
lsb_release -a  LSB (Linux Standard Base) and Distribution information


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
chmode [[u/g/o/a] [+/-/=] [rwx]] file 例子 chmod  u=rwx,go=rx  .bashrc 与chmod 755 .bashrc一样 chmod  a+w  .bashrc 增加可写权限

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
Sticky Bit



## maven仓库镜像

> 下载工具  
> lftp http://maven.aliyun.com/nexus/content/repositories/central/ -e 'mirror .'
