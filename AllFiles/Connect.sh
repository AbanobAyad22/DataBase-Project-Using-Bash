#!/bin/bash
zz=$PWD
pwd    #AllFiles where i run the script
read -p "Which Data Base you want to Connect :" Con
cd ..   
cd DataBases/
while true
do
    if [[ -z $Con ]];then
        echo "No DataBase"
        read -p "Enter Your DataBase : " Con
        
        elif [[ -d $Con ]];then
        cd $Con
        select name in "Create Table" "insert and update" "list table" "drop table"   "select from table" "delete from table"  "Return To Data Base"; do
            case $name in
                "Create Table")
                    export  Con
                    cd $zz
                    ./CreateTable.sh
                ;;
                "insert and update")
                    export  Con
                    cd $zz
                    ./insertUpdate.sh
                    ;;
                    # "insert Meta Data")
                    #     export  Con
                    #     cd $zz
                    #     ./InsertMetaData.sh
                    # ;;
                    # "update from table")
                    #     export  Con
                    #     cd $zz
                    #     ./UpdateFromTable.sh
                    # ;;
                    
                    "list table")
                        export  Con
                        cd $zz
                        ./ListTable.sh
                        
                    ;;
                    "drop table")
                        export  Con
                        cd $zz
                        ./DropTable.sh
                    ;;
                    
                    
                    "select from table")
                        export  Con
                        cd $zz
                        ./SelectTable.sh
                    ;;
                    "delete from table")
                        export  Con
                        cd $zz
                        ./DeleteFromTable.sh
                    ;;
                    
                    "Return To Data Base")
                        cd $zz
                        ./Begining.sh
                        
                    ;;
            esac
        done
    else
        echo "No Data Base"
        read -p "Which Data Base you want to Connect :" Con
        
    fi
done