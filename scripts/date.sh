#!/usr/bin/env bash

DATE=$(date -Idate)
IFS=- read -r YEAR MONTH DAY <<<$DATE
# those who convert months into strings
MONTH_NUM=$(($MONTH))
MONTHS=(ZERO January February March April May June July August September October November December)

echo ${MONTHS[$MONTH_NUM]} $DAY $YEAR
