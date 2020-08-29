#!/bin/bash


# Specify 'dirb' as the path under which folder the folder ds000109_R2.0.2 that contains the data is located.
# For example
#dirb=/home/isaiah

cd $dirb

# Script to re-orient functional images for each subject + brain extraction
# Images need to be checked manually and re-done as necessary


for x in $(ls ds000171/sub-control[0-2][0-9]/func/sub-control[0-2][0-9]_task-music_run-[1-5]_bold.nii.gz)
do

	echo "This is $x"

	[[ $x =~ .*(sub-control..).*(run-.)_.* ]]
	echo "exitcode:$?"
	echo ${BASH_REMATCH[1]} ${BASH_REMATCH[2]}

	fslreorient2std $x $x

	y1=${BASH_REMATCH[1]}
	y2=${BASH_REMATCH[2]}


	if [ "$y2" == "run-3"  ]
	then
		bet ds000171/$y1/anat/$y1\_T1w.nii.gz ds000171/$y1/anat/$y1\_T1w_brain.nii.gz -R -g -0.05 -m
	fi

done
