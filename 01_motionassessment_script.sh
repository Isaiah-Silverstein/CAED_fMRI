#!/bin/bash
#

# Specify 'dirb' as the path under which folder the folder ds000109_R2.0.2 that contains the data is located.
# For example
# dirb=/folder/where/my/datafolder/is/located/


cd $dirb

outhtml=ds000171/motion_QA.html
dirhtml=ds000171

for x in $(ls ds000171/sub-control[0-2][0-9]/func/sub-control[0-2][0-9]_task-music_run-[1-5]_bold.nii.gz
)
do
  [[ $x =~ .*(sub-control..).*(run-.)_.* ]]
  echo ${BASH_REMATCH[1]}
  echo ${BASH_REMATCH[2]}
  mkdir -p ds000171/${BASH_REMATCH[1]}/func/motion/${BASH_REMATCH[2]}
  mpath=ds000171/${BASH_REMATCH[1]}/func/motion/${BASH_REMATCH[2]}

  pathpng=${mpath#$dirhtml}

  fsl_motion_outliers -i $x -o $mpath/confound.txt --fd --thresh=0.9 -p $mpath/fd_plot -v > $mpath/outlier_output.txt

  echo "<h2> ${BASH_REMATCH[1]} - ${BASH_REMATCH[2]} </h2>" >> $outhtml
  cat $mpath/outlier_output.txt >> $outhtml
  echo "<p> <b> Framewise Displacement plot </b> <br><IMG BORDER=\"0\" SRC=\"${pathpng}/fd_plot.png\" WIDTH=\"100%\"></BODY></HTML>" >> $outhtml

  if [ ! -f $mpath/confound.txt ]
  then
  touch $mpath/confound.txt
  fi
done
