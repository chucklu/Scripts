for %%G in (*.sql) do sqlcmd -S 127.0.0.1 -d datbaseName -U login -P "password" -i"%%G" >> sql.log
pause