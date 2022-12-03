#!/bin/bash
set -x
source functions.sh

operation=$1
echo $operation

while getopts "ap:h:u:n::U:i:y:help:" o; do
                                case "${o}" in
                                        \?) echo "Press -help for more info";;
                                        a) action=add;;
                                        p) port=${OPTARG} ;;
                                        h) host=${OPTARG} ;;
                                        u) user=${OPTARG} ;;
                                        U) action=update ;;
                                        n) alias=${OPTARG} ;;
                                        i) key_id=${OPTARG} ;;
                                        help) action=help
                                esac
done

if [[ $operation == "rm" ]]
then
    echo "entering delete function"
    deletessh $2
    echo "exit delete function"
fi

################################################
if [[ $# = 1 && $operation == "ls" ]]
then

    lists 
    exit
elif [[ $# = 2 && $operation == 'ls' && $2 == '-d'  ]]
then
    listDetails 
    exit
 elif [ $# = 2 ] && [ $1 == 'rm' ]          
then
	axtion=deletessh                
	deletessh $2
	exit

fi
# ################################################

if [[ $action == 'add' ]]
then
    addHostCnfig $alias $host $user $port $key_id 
elif [[ $action == 'update' ]]
then 
    alias=$3
    hostName=$5
    userName=$7
    portno=$9
    echo "before update function!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!"
    updatessh $alias $hostName $userName $portno
    echo "update function"
fi 
