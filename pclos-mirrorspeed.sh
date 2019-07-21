#/bin/bash 

#Check if curl is installed
command -v curl >/dev/null 2>&1 || { echo >&2 "I require curl but it's not installed.  Aborting."; exit 1; }

#Creating an empty temporary file
cat /dev/null > ~/tmp/mirrorspeeds.txt

echo "Wait a second while I download the last mirror list"
echo ""

#Test every mirror on the list
for i in `curl -s -L https://www.dropbox.com/s/aps6wim7xvnxoam/sources.list?dl=1 |tail --lines=+5|sed 's/# //g' |awk '{print $2}'`
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
sort -n ~/tmp/mirrorspeeds.txt
