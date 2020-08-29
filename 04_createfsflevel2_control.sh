#!/bin/bash
#

# Specify 'WDIR' as the path under which folder the folder ds000109_R2.0.2 that contains the data is located.
# For example
# WDIR='/folder/where/my/datafolder/is/located'
# IMPORTANT: also create WDIR_sed as follows:
# WDIR_sed='\/folder\/where\/my\/datafolder\/is\/located'


WDIR='/home/isaiah'
WDIR_sed='\/home\/isaiah'
cd $WDIR

declare -i y=1


for x in $(ls ds000171/sub-control[0-2][0-9]/func/sub-control[0-2][0-9]_task-music_run-[1-5]_bold.nii.gz
)
do
   [[ $x =~ .*(sub-control..).*(run-.)_.* ]]

   SUBJECT=${BASH_REMATCH[1]}
   RUNNR=${BASH_REMATCH[2]}

   if [ "$RUNNR" == "run-1" ]
   then
        RUNNR1="run-1"
	RUNNR2="run-2"
	RUNNR3="run-3"
        sed "s/{{SUBJECT}}/${SUBJECT}/g;s/{{WDIR}}/${WDIR_sed}/g;s/{{RUNNR1}}/${RUNNR1}/g;s/{{RUNNR2}}/${RUNNR2}/g;s/{{RUNNR3}}/${RUNNR3}/g" ${WDIR}/ds000171/within_subj_design.fsf > ${WDIR}/ds000171/$SUBJECT/within_$SUBJECT\_design.fsf
   fi

  if [ "$RUNNR" == "run-5" ]
  then
	RUNNR1="run-3"
	RUNNR2="run-4"
	RUNNR3="run-5"
	sed "s/{{SUBJECT}}/${SUBJECT}/g;s/{{WDIR}}/${WDIR_sed}/g;s/{{RUNNR1}}/${RUNNR1}/g;s/{{RUNNR2}}/${RUNNR2}/g;s/{{RUNNR3}}/${RUNNR3}/g" ${WDIR}/ds000171/within_subj_design.fsf > ${WDIR}/ds000171/$SUBJECT/within_$SUBJECT\_design.fsf
  fi

done
