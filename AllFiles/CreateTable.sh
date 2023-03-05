#!/bin/bash
shopt -s extglob
cd ..
cd DataBases/$Con
pwd




read -p "Enter Your TableName : " TableName

while true
do
    if  [[ -f $TableName || -d $TableName ]]   ;then
        echo "Already Exist"
        read -p "Enter Your TableName : " TableName
        
        elif [[ ${TableName:0:1} == [0-9] ]]; then     #Bring the first number and prevent 
        echo "Dont Enter the Number"
        read -p "Enter Your TableName : " TableName
        
        
        elif [[ -z $TableName ]];then
        echo "cant enter an empty name"
        read -p "Enter Your TableName : " TableName
        
        elif [[ $TableName == *['!'@#\$%^\&*()+]* ]] ||  [[ "$TableName" == *\  ]];then
        echo "invalid"
        read -p "Enter Your TableName : " TableName
        
        
        elif [[ $TableName == *[" "]* ]];then   #space at any character of word inserted
        echo "invalid"
        read -p "Enter Your TableName : " TableName
        
    else
        touch $TableName
        break
        
    fi
done