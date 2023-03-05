#!/bin/bash
read -p "Enter Your DataBase : " DataBase
cd ..
cd DataBases
while true
do
if  [[ -f $DataBase || -d $DataBase ]]   ;then
echo "Already Exist"
read -p "Enter Your DataBase : " DataBase

elif [[ ${DataBase:0:1} == [0-9] ]]; then 
echo "Dont Enter the Number"
read -p "Enter Your DataBase : " DataBase

elif [[ -z $DataBase ]];then
echo "cant enter an empty name"
read -p "Enter Your DataBase : " DataBase

elif [[ $DataBase == *['!'@#\$%^\&*()_+]* ]];then
echo "invalid"
read -p "Enter Your DataBase : " DataBase

elif [[ $DataBase == *[" "]* ]];then
echo "invalid"
read -p "Enter Your DataBase : " DataBase

else
mkdir $DataBase
break


fi
done