:start
@echo off
echo ========= Test Start ==============
echo 1=¯ʯ��˵
echo 2=ħ������
echo 3=�����ȷ�/�����ƻ���3
echo 4=�籩Ӣ��/�Ǽ�2/ս���ͻ���
echo _
set /p input="����������Ҫ����������Ե���Ϸ�����ֱ��:"


if "%input%"=="1" goto A
if "%input%"=="2" goto B
if "%input%"=="3" goto C
if "%input%"=="4" goto D
pause
@echo �Բ��������������������������Ӧ��Ϸ�����ֱ�š�
echo _
goto:start

:A
ping -n 10 223.252.226.255 >> .\ADSL.Net.HS-Report.Ver%date:~0,4%-%date:~5,2%-%date:~8,2%.txt
tracert -d 114.113.217.255 >> .\ADSL.Net.HS-Report.Ver%date:~0,4%-%date:~5,2%-%date:~8,2%.txt
pause
echo ========= Test Completed ==============
exit

:B
ping -n 10 223.252.226.255 >> .\ADSL.Net.WoW-Report.Ver%date:~0,4%-%date:~5,2%-%date:~8,2%.txt
tracert -d 203.95.208.255 >> .\ADSL.Net.WoW-Report.Ver%date:~0,4%-%date:~5,2%-%date:~8,2%.txt
tracert -d 103.205.52.255 >> .\ADSL.Net.WoW-Report.Ver%date:~0,4%-%date:~5,2%-%date:~8,2%.txt
pause
echo ========= Test Completed ==============
exit

:C
ping -n 10 223.252.226.255 >> .\ADSL.Net.OW-D3-Report.Ver%date:~0,4%-%date:~5,2%-%date:~8,2%.txt
tracert -d 223.252.226.255 >> .\ADSL.Net.OW-D3-Report.Ver%date:~0,4%-%date:~5,2%-%date:~8,2%.txt
pause
echo ========= Test Completed ==============
exit

:D
ping -n 10 223.252.226.255 >> .\ADSL.Net.Heroes-SC2-Bnetapp-Report.Ver%date:~0,4%-%date:~5,2%-%date:~8,2%.txt
tracert -d 122.198.65.254 >> .\ADSL.Net.Heroes-SC2-Bnetapp-Report.Ver%date:~0,4%-%date:~5,2%-%date:~8,2%.txt
pause
echo ========= Test Completed ==============
exit

