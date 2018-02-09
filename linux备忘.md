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