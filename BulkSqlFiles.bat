@echo off
for %%G in (*.sql) do (
rem output file name of sql
echo %%G >> sql.log
rem execute the sql by sqlcmd
sqlcmd -S 127.0.0.1 -d datbaseName -U login -P "password" -i "%%G" -I >> sql.log
rem output two new line
echo. >> sql.log
echo. >> sql.log
)
pause