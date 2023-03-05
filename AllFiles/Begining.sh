#!/bin/bash
select name in "create database" "list database" "drop database" "connect"; do
    case $name in
    "create database")
        ./CreateDbValidation.sh
        ;;
    "list database")
        ./ListDb.sh
        ;;
    "drop database")
        ./DropDb.sh
        ;;
    "connect")
        ./Connect.sh
        ;;

    esac
done
