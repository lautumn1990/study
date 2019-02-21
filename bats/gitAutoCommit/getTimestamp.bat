:: 编码格式 GB2312
:: 脚本创建时最好选择GB2312编码(方式很简单，新建txt文件，输入几个中文字符保存后将后缀.txt改成.bat)
:: @echo off 表示不回显执行的命令
@echo off 
 
:: 日期截取遵从格式 %date:~x,y%，表示从第x位开始，截取y个长度(x,y的起始值为0)
:: windows下DOS窗口date的结果 2016/09/03 周六
:: 年份从第0位开始截取4位，月份从第5位开始截取2位，日期从第8位开始截取2位
set YEAR=%date:~0,4%
set MONTH=%date:~5,2%
set DAY=%date:~8,2%
 
:: 时间截取遵从格式 %time:~x,y%，表示从第x位开始，截取y个长度(x,y的起始值为0)
:: windows下DOS窗口time的结果 12:05:49.02 
:: 时钟从第0位开始截取2位，分钟从第3位开始截取2位，秒钟从第6位开始截取2位
set HOUR=%time:~0,2%
set MINUTE=%time:~3,2%
set SECOND=%time:~6,2%
:: 毫秒
set MILLISECIOND=%time:~9,2%
 
:: 当时钟小于等于9时,前面有个空格，这时我们少截取一位，从第1位开始截取
set TMP_HOUR=%time:~1,1%
set NINE=9
set ZERO=0
:: 处理时钟是个位数的时候前面补上一个0, LEQ表示小于等于
if %HOUR% LEQ %NINE% set HOUR=%ZERO%%TMP_HOUR%
 
REM set CURRENT_DATE_TIME_STAMP=%YEAR%%MONTH%%DAY%%HOUR%%MINUTE%%SECOND%%MILLISECIOND%
set CURRENT_DATE_TIME_STAMP=%YEAR%%MONTH%%DAY%%HOUR%%MINUTE%%SECOND%
REM mkdir  %CURRENT_DATE_TIME_STAMP%