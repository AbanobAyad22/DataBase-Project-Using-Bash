#!/bin/bash
shopt -s extglob
cd ..
cd DataBases/$Con
pwd
declare -a arrexport=()
typeset -i i=1
typeset -i s=1
declare -a arrDType=()
read -p "which table you want to access : " Table
#typeset -i count=$(( ` echo $Table | wc -l ` - 1 ))
#declare -a arrprimarykey=( $(tail -${count} $Table | awk '{ print $1 }') )
while true; do
    if [[ ! -f $Table ]]; then
        echo "The Table Doesnt Exist Enter Valid Table : "
        read -p "which table you want to access : " Table
    else
        select name in "Create Meta Data" "Insert Into Table"  "Update FRom Table"  "Exit";do
            case $name in
                "Create Meta Data")
                    if [[ `head -1 $Table | wc -c` -gt 2 ]];then
                        echo "Table Has Already Meta Data"
                        break
                    else
                        read -p "Enter number of Record You want to Add : " Num
                        while true; do
                            if [[ $Num == +([a-zA-Z]) || -z $Num  || $Num == *['!'@#\$%^\&*()_+]* ]]; then
                                echo "Invalidd"
                                read -p "Enter number of Record You want to Add : " Num
                            else
                               # echo "The first Record will be Primary Key"
                                read -p "Enter Records  number $i : " Rec
                                while [[ $i -le $Num ]]; do
                                    if [[ -z $Rec || $Rec == +([0-9]) || $Rec == *['!'@#\$%^\&*()_+]*  ]]; then
                                        echo "Invalid"
                                        read -p "Enter Records  number $i : " Rec

                                    else

                                        read -p "s Or i : " arrDataType
                                        while true ;do
                                       if [[ $arrDataType == "i" || $arrDataType == "s" ]];then

                                        arrDType+=($arrDataType)
                                        echo -n ${arrDType[$i-1]} " " >>meta
                                        echo -n $Rec " " >>$Table
                                        i=$(($i + 1))
                                        break
                                        else
                                        echo "data type must be i or s"
                                        read -p "s Or i : " arrDataType
                                        fi
                                        done

                                        if [[ $i -gt $Num ]];then
                                            break
                                        else
                                            read -p "Enter Records  number $i : " Rec
                                        fi
                                    fi
                                done
                                break
                            fi

                        done
                        echo -e "\n" >>$Table

                    fi
                    echo "${arrDType[@]}"
                ;;

                #Insert Into Table
                "Insert Into Table")
                    typeset -i ss=1
                    typeset -i addr=1
                    datatype=`cat meta`
                    IFS=" " read -ra arrexport <<< "$datatype"  #r=disable scape character a=store word in array #ifs spcial variable for organizing
                    # echo ${#arrexport[@]}
                    Numb=`head -1 $Table | wc -w`
                     typeset -i AddRow=1
                    while  [[ $addr -le $AddRow ]];do
                        if [[ `head -1 $Table | wc -c` -gt 2 ]];then
                            while [[ $ss -le $Numb ]];do
                                read -p "Enter Data in column : " Inserted
                                if [[ $Inserted == +([a-zA-Z]) && ${arrexport[$ss-1]} == 's'  ]];then
                                    echo -n $Inserted " " >>$Table
                                    ss=$(($ss + 1))
                                    elif [[ $Inserted == +([0-9]) && ${arrexport[$ss-1]} == 'i' ]];then
                                    echo -n $Inserted " " >>$Table
                                    ss=$(($ss + 1))
                                else
                                    echo "You Must enter s or i"
                                fi
                            done

                        else
                            echo "there is no meta data"
                            break
                        fi
                        echo >> $Table
                        addr=$(($addr + 1))
                    done
                ;;
                "Update FRom Table")
                    datatype=`cat meta`
                IFS=" " read -ra arrexport <<< "$datatype"
                read -p "Enter Num Of Row you want to updata : " Col
                    sed -n '3,$p' $Table | awk -v i=$Col '{if(NR==i) print $0}'
                    echo
                    head -1 $Table | awk '{print $0}'
                    read -p "enter colum number" numcol
                    Filter=$(sed -n '3,$p' $Table   | awk -v a="$Col" -v i="$numcol" 'NR == a {print $i}' )
                    echo $Filter
                    read -p "Enter Replaced value: " rrr

                    while true ;do
                        if [[ $rrr == +([a-zA-Z]) && ${arrexport[$numcol-1]} == 's' ]];then
                            sed -i "s/$Filter/$rrr/g" $Table
                            break
                        elif [[ $rrr == +([0-9]) && ${arrexport[$numcol-1]} == 'i' ]];then

                            # id=`awk 'NR==FNR{a[$1]++;next;}{ if (a[$1] > 1)print;}' aa aa`

                            # if [[ $id == `echo -e "\n"` ]];then
                            # echo 
                            # else 
                            # echo error
                            # fi

                            sed -i "s/$Filter/$rrr/g" $Table
                            break
                        else
                            echo "datatype didn't match"
                            read -p "Enter Replaced value : " rrr
                        fi
                    done
                        cat $Table
            echo

                ;;
                "Exit")
                    cd ..
                    cd ..
                    cd AllFiles
                    ./Connect.sh

                ;;
            esac
        done
    fi
done
