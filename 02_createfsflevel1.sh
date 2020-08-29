#!/bin/bash
#

# Specify 'WDIR' as the path under which folder the folder ds000109_R2.0.2 that contains the data is located.
# For example
# WDIR='/folder/where/my/datafolder/is/located'
# IMPORTANT: also create WDIR_sed as follows:
# WDIR_sed='\/folder\/where\/my\/datafolder\/is\/located'


WDIR='/home/isaiah/'

WDIR_sed='\/home\/isaiah'

cd $WDIR

for x in $(ls ds000171/sub-mdd[0-1][0-9]/func/sub-mdd[0-1][0-9]_task-music_run-[1-5]_bold.nii.gz
)
do
  [[ $x =~ .*(sub-mdd..).*(run-.)_.* ]]
  SUBJECT=${BASH_REMATCH[1]}
  RUNNR=${BASH_REMATCH[2]}

  nrrun=${RUNNR: -1}
  nrsubject=${SUBJECT: -2}

  sed "s/{{RUNNR}}/${RUNNR}/g;s/{{SUBJECT}}/${SUBJECT}/g;s/{{nrrun}}/${nrrun}/g;s/{{nrsubject}}/${nrsubject}/g;s/{{WDIR}}/${WDIR_sed}/g" ${WDIR}/ds000171/within_run_design.fsf > ${WDIR}/ds000171/$SUBJECT/design_${RUNNR}.fsf

done
