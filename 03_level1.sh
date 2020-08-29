#!/bin/bash
#

# Specify 'WDIR' as the path under which folder the folder ds000109_R2.0.2 that contains the data is located.
# For example
WDIR='/home/isaiah/ds000171'


cd $WDIR

for x in $(ls ds000171/sub-[0-4][0-9]/func/sub-[0-4][0-9]_task-music_run-[1-5]_bold.nii.gz
)
do
  [[ $x =~ .*(sub-..).*(run-.)_.* ]]
  SUBJECT=${BASH_REMATCH[1]}
  RUNNR=${BASH_REMATCH[2]}

  echo $SUBJECT
  echo $RUNNR

  feat ds000171/${SUBJECT}/design_${RUNNR}.fsf

done
