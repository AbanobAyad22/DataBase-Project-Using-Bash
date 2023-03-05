#!/bin/bash
cd ..
cd DataBases/$Con

read -p "Which table you want to delete : " del

while true 
do
if [[ -f $del ]];then
rm $del
break
else 
echo "Not Exist"
read -p "Which table you want to delete : " del
fi
done