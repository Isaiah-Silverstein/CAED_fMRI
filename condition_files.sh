#!/bin/bash


# Specify 'dirb' as the path under which folder  you need is
#dirb=/home/isaiah

cd $dirb

# Script to convert tsv files to text file columns
# Do per run to account for counterbalancing


for x in $(ls ds000171/sub-mdd[0-1][1-9]/func/sub-mdd[0-1][1-9]_task-music_run-[1-5]_events.tsv)
do
	pwd
        echo "This is $x"
        [[ $x =~ .*(sub-mdd..).*(run-.)_.* ]]
        echo "exitcode:$?"
        echo ${BASH_REMATCH[1]} ${BASH_REMATCH[2]}

        y1=${BASH_REMATCH[1]}
        y2=${BASH_REMATCH[2]}
	ds000171/$y1/func/BIDSto3col.sh $x $y1\_$y2

done


