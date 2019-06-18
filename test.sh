#!/bin/bash
date
date -d "-7 days"
today="$(date '+%Y-%m-%d')"
yesterday="$(date -d yesterday '+%Y-%m-%d')"
echo $today
echo $yesterday

test=$(date -d '2019-07-04 12:45:00' +%Y-%m-%d" "%H:%M:%S)
echo $test

let index=0

git filter-branch -f --env-filter '
index=$((index + 1))
echo $index
echo 
echo $GIT_COMMIT
' 67d9d9..temp