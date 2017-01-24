#!/bin/bash
curuname=`whoami`
lastlog | grep $curuname | head -n 2 | tail -n 1 > .lastrecod
cat .lastrecod
gawk '{print $4, $5, $6, $8}' .lastrecod > .timerecod

mon=`gawk '{print $1}' .timerecod`
monnum=0
echo $mon

case $mon in
    Jan)
        monnum=01
    ;;
    Feb)
        monnum=02
    ;;
    Mar)
        monnum=03
    ;;
	Apr)
		monnum=04
	;;
	May)
		monnum=05
	;;
	Jun)
		monnum=06
	;;
	Jul)
		monnum=07
	;;
	Aug)
		monnum=08
	;;
	Sep)
		monnum=09
	;;
	Oct)
		monnum=10
	;;
	Nov)
		monnum=11
	;;
	Dec)
		monnum=12
	;;
    *)
        monnum=01
    ;;
esac
day=`awk '{print $2}' .timerecod`
gawk '{print $3}' .timerecod > .timetmp
hour=`gawk -F : '{print $1}' .timetmp`
minite=`gawk -F : '{print $2}' .timetmp`
s=00
year=`awk '{print $4}' .timerecod`
lasttime=$year""$monnum""$day""$hour""$minite""$s
echo $lasttime
lastb -t $lasttime | grep `whoami` > tlog2
lastb | grep `whoami` > tlog1
cat tlog2
diff -ar tlog1 tlog2

