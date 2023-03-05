#!/bin/bash
cd ..
cd DataBases/$Con
pwd


read -p "Enter a Table you want to Delete: " Ta
while true ;do
    if [[ -f $Ta ]]
    then
        if [[ -z $Ta || $Ta == *['!'@#\$%^\&*()_+]* || $Ta == +([0-9]) ]];then
            echo "invalid"
            read -p "Enter a Table you want to Delete: " Ta
        else
            select s in "Delete All" "Delete a specific Row";do
                case $s in
                    "Delete All")
                        sed -i '3,$d' $Ta
                    ;;
                    "Delete a specific Row")
                        read -p "Enter Num Of Row : " Col
                        Col=$(($Col + 2))
                        sed -i "$Col"'d' $Ta
                        
                        
                esac
            done
            
            
        fi
    else
        echo "Table Doesnot Exist"
        read -p "Enter a Table you want to Delete: " Ta
    fi
done