#!/bin/bash
#

# Specify 'dirb' as the path under which folder the folder that contains the data is located.
# For example
dirb=/home/isaiah/

cd $dirb

outlier_QA=ds000171/motion_QA_outlier.txt


for x in $(ls ds000171/sub-mdd[0-2][0-9]/func/sub-mdd[0-2][0-9]_task-music_run-[1-5]_bold.nii.gz)
do

  [[ $x =~ .*(sub-mdd..).*(run-.)_.* ]]
  echo ${BASH_REMATCH[1]}
  echo ${BASH_REMATCH[2]}

  mov=$(grep -o 1 ds000171/${BASH_REMATCH[1]}/func/motion/${BASH_REMATCH[2]}/confound.txt | wc -l)
  echo $mov
  if [ $mov -gt 40 ]
  then
 	 echo "${BASH_REMATCH[1]} ${BASH_REMATCH[2]} $mov" >> $outlier_QA
  fi

done
