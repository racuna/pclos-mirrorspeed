#/bin/bash +x

cat /dev/null > ~/tmp/mirrorspeeds.txt

for i in `cat mirror_list.txt |awk '{print $2}'`
do
echo "Calculating AVG speed for:"
echo $i
SPEED=`curl -s -w %{time_total}\\n -o /dev/null $i`
echo "Result:"
echo $SPEED

echo $SPEED $i >> ~/tmp/mirrorspeeds.txt

echo ""

done

echo "Mirror list ordered by speed of response:"
sort ~/tmp/mirrorspeeds.txt
