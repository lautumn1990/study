:: �����ʽ GB2312
:: �ű�����ʱ���ѡ��GB2312����(��ʽ�ܼ򵥣��½�txt�ļ������뼸�������ַ�����󽫺�׺.txt�ĳ�.bat)
:: @echo off ��ʾ������ִ�е�����
@echo off 
 
:: ���ڽ�ȡ��Ӹ�ʽ %date:~x,y%����ʾ�ӵ�xλ��ʼ����ȡy������(x,y����ʼֵΪ0)
:: windows��DOS����date�Ľ�� 2016/09/03 ����
:: ��ݴӵ�0λ��ʼ��ȡ4λ���·ݴӵ�5λ��ʼ��ȡ2λ�����ڴӵ�8λ��ʼ��ȡ2λ
set YEAR=%date:~0,4%
set MONTH=%date:~5,2%
set DAY=%date:~8,2%
 
:: ʱ���ȡ��Ӹ�ʽ %time:~x,y%����ʾ�ӵ�xλ��ʼ����ȡy������(x,y����ʼֵΪ0)
:: windows��DOS����time�Ľ�� 12:05:49.02 
:: ʱ�Ӵӵ�0λ��ʼ��ȡ2λ�����Ӵӵ�3λ��ʼ��ȡ2λ�����Ӵӵ�6λ��ʼ��ȡ2λ
set HOUR=%time:~0,2%
set MINUTE=%time:~3,2%
set SECOND=%time:~6,2%
:: ����
set MILLISECIOND=%time:~9,2%
 
:: ��ʱ��С�ڵ���9ʱ,ǰ���и��ո���ʱ�����ٽ�ȡһλ���ӵ�1λ��ʼ��ȡ
set TMP_HOUR=%time:~1,1%
set NINE=9
set ZERO=0
:: ����ʱ���Ǹ�λ����ʱ��ǰ�油��һ��0, LEQ��ʾС�ڵ���
if %HOUR% LEQ %NINE% set HOUR=%ZERO%%TMP_HOUR%
 
REM set CURRENT_DATE_TIME_STAMP=%YEAR%%MONTH%%DAY%%HOUR%%MINUTE%%SECOND%%MILLISECIOND%
set CURRENT_DATE_TIME_STAMP=%YEAR%%MONTH%%DAY%%HOUR%%MINUTE%%SECOND%
REM mkdir  %CURRENT_DATE_TIME_STAMP%