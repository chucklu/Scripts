#!/bin/bash
date
date -d "-7 days"
today="$(date '+%Y-%m-%d')"
yesterday="$(date -d yesterday '+%Y-%m-%d')"
echo $today
echo $yesterday
