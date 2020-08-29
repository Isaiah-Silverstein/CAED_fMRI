#!/bin/bash
#

# Specify 'WDIR' as the path under which folder the folder ds000109_R2.0.2 that contains the data is located.
# For example
# WDIR='/home/isaiah/'
cd $WDIR

for x in $(ls ds000171/sub-mdd[0-1][0-9]/func/sub-mdd[0-1][0-9]_task-music_run-1_bold.nii.gz
)
do
  [[ $x =~ .*(sub-..).*(run-.)_.* ]]
  SUBJECT=${BASH_REMATCH[1]}

  echo $SUBJECT

  feat ds000109_R2.0.2/${SUBJECT}/within_subj_design.fsf

done
