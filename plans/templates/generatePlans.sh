# 1. template file
# 2. out file
# 3. %WALL_TIME%
# 4. %MEMORY%
# 5. %FILE%

function wallTime()
{

if [ $1 == 'DC' ]; then
	if [ $2 == 10 ]; then
		echo 00:10:00
	elif [ $2 == 100 ]; then
		echo 00:10:00
	elif [ $2 == 1000 ]; then
		echo 01:00:00
	else
		echo 01:00:00
	fi
else
	if [ $2 == 10 ]; then
		echo 00:10:00
	elif [ $2 == 100 ]; then
		echo 01:00:00
	elif [ $2 == 1000 ]; then
		echo 01:00:00
	else
		echo 01:00:00
	fi
fi
}

function memory()
{
if [ $1 == 'DC' ]; then
	if [ $2 == 10 ]; then
		echo 1
	elif [ $2 == 100 ]; then
		echo 5
	elif [ $2 == 1000 ]; then
		echo 10
	else
		echo 20
	fi
else
	echo 2
fi
}

function extractTaxa()
{
echo $1 | grep -oP '(?<=nSites-).*(?=_nTaxa)'
}

for simulatedTree in $(ls ../../data | sed s/\.[^\.]*$// | sort -u); do

nTaxa=`extractTaxa $simulatedTree`
DCwallTime=`wallTime 'DC' $nTaxa`
DCmemory=`memory 'DC' $nTaxa`

MBwallTime=`wallTime 'MB' $nTaxa`
MBmemory=`memory 'MB' $nTaxa`


./buildPlans.sh dc-template ../run/${simulatedTree}_dc $DCwallTime $DCmemory $simulatedTree
./buildPlans.sh mb-template ../run/${simulatedTree}_mb $MBwallTime $MBmemory $simulatedTree

done





