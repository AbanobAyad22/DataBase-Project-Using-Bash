#!/bin/bash
read -p "Enter the DataBase you want To Remove : " Removed
cd ..
cd DataBases/
while true
do
if [[ -d $Removed ]];then
rm -r $Removed
echo "Removed Successfully"
break
else 
    echo "No DataBase"
    read -p "Enter the DataBase you want To Remove : " Removed
fi
done