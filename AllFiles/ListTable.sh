#!/bin/bash
cd ..
cd DataBases/$Con
if [ -n "$(ls -A)" ];then      #print files only with count  
ls
else 
  echo "Empty"
fi