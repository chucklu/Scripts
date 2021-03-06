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
echo
git filter-branch -f --env-filter '
index=$((index + 1))
echo
echo $index
startDate=$(date -d ''2019-07-01'')
NEXT_DATE=$(date +%Y-%m-%d" "%T -d "$startDate + $index day")
echo $NEXT_DATE
echo $GIT_COMMIT
echo
' 67d9d9..temp


DATE=2013-05-25

for i in {0..8}
do
   NEXT_DATE=$(date +%m-%d-%Y -d "$DATE + $i day")
   echo "$NEXT_DATE"
done