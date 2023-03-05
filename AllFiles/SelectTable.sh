#!/bin/bash
shopt -s extglob
cd ..
cd DataBases/$Con
pwd

typeset -i s
read -p "Enter a Table you want to show : " Ta
while true
do
    if [[ -f $Ta ]];then
        select name in "Select All" "ProJection" "Select By Row"; do
            case $name in
                "Select All")
                    sed -n '2,$p' $Ta
                    echo -e "\n" #Allow scape sequance 
                    
                ;;
                "ProJection")
                    NumberOfField= head -1  $Ta | awk '{ print NF }'
                    select i in ` head -1 $Ta | awk '{print $0}' `; do
                        echo "Selected character: $i"
                        echo "Selected number: $REPLY"
                        echo "Number  : $s"
                        awk -v  ss=$REPLY '{print $ss}' $Ta
                    done
                ;;
                "Select By Row")
                    
                    read -p "Enter Num Of Row : " Col
                    while true ;do
                    if [[ -z $Col || $Col == *['!'@#\$%^\&*()_+]* || $Col == +([a-zA-Z]) ]];then
                        echo "invalid"
                        read -p "Enter Num Of Row : " Col
                    else
                        sed -n '3,$p' $Ta | awk -v i=$Col '{if(NR==i) print $0}'
                        break
                    fi
                     done
                ;;
            esac
            
        done
        
    else
        echo "Table Doesnot Exist"
        read -p "Enter a Table you want to show : " Ta
    fi
done