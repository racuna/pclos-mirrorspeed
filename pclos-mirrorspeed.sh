#/bin/bash 

#Check if curl is installed
command -v curl >/dev/null 2>&1 || { echo >&2 "I require curl but it's not installed.  Aborting."; exit 1; }

#Creating an empty temporary file
cat /dev/null > ~/tmp/mirrorspeeds.txt

#Test every mirror on the list
for i in `curl https://raw.githubusercontent.com/racuna/pclos-mirrorspeed/master/mirror_list.txt |awk '{print $2}'`
do
	echo "Calculating AVG speed for:"
	echo $i
	SPEED=`curl -s -w %{time_total}\\n -o /dev/null $i`
	echo "Result:"
	echo $SPEED

	#put results on the temp file
	echo $SPEED $i >> ~/tmp/mirrorspeeds.txt
	echo ""

done

#Show total results
echo "Mirror list ordered by speed of response:"
sort ~/tmp/mirrorspeeds.txt
