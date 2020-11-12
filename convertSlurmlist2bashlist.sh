#!/bin/bash

# uncomment the following line for new input
#slurm_list=$1
slurm_list="slurm-[109,117,120-121,135-137,140,146-156,165-171,173,176-182,185,187-191,207]"

list=`echo $slurm_list|awk -F "[" '{print $2 '}`
list=`echo $list|awk -F "]" '{print $1 '}`
list_ar=(`echo $list| tr ',' ' '`)

for i in ${list_ar[@]}
do
  if [[ "$i" == *"-"* ]]
  then
       begin=`echo $sample |awk -F "-" ' { print $1 '}`
       end=`echo $sample |awk -F "-" ' { print $2 '}`
       echo "{$begin..$end}"
  else
       echo $i
  fi
done 


