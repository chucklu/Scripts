:start
@echo off
echo ========= Test Start ==============
echo 1=炉石传说
echo 2=魔兽世界
echo 3=守望先锋/暗黑破坏神3
echo 4=风暴英雄/星际2/战网客户端
echo _
set /p input="请输入您需要进行网络测试的游戏的数字编号:"


if "%input%"=="1" goto A
if "%input%"=="2" goto B
if "%input%"=="3" goto C
if "%input%"=="4" goto D
pause
@echo 对不起，您的输入有误，请重新输入对应游戏的数字编号。
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

