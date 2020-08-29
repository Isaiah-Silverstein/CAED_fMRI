
#!/bin/bash
#

for x in $(ls ./sub-*[0-2][0-9]/func/sub-*[0-4][0-9]_task-*_run-[1-5]_bold.nii.gz
)
do
y=$(fslnvols $x)
[[ $x =~ .*(sub-..).*(*_run-..)_.* ]]
echo "$x"
echo ${BASH_REMATCH[1]} ${BASH_REMATCH[2]} $y
done
