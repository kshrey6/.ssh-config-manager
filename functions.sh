
function addHostCnfig() {
        echo "Host "$1>>~/.ssh/config
        echo "Hostname "$2>>~/.ssh/config
        echo "User "$3>>~/.ssh/config
        if [[ $# -eq 4 ]]
        then
        echo  "LocalForward "$4 localhost:22>>~/.ssh/config 
        else
        echo  "LocalForward "localhost:22>>~/.ssh/config
        fi 
        echo "IdentityFile "$5>>~/.ssh/config 
        echo " ">>~/.ssh/config
}

function lists() {
        awk '{if ($1 == "Host") {print$2}} ' ~/.ssh/config
}

function listDetails(){
	#echo 'In list ssh detailed.. changing rows to column'
	output=$(awk -v RS= -v OFS=';' '{$1 = $1} NR > 1 {print ""}1' ~/.ssh/config)
    echo $output
}

function deletessh() {
    serverName=$1
    sed -i "/$serverName/{N;N;N;N;N;d}" ~/.ssh/config
    echo "connection named $serverName deleted"
}

function updatessh(){
    while getopts "ap:h:u:n:i:y:help:" o; do
                                case "${o}" in
                                        \?) echo "Press -help for more info";;
                                        p) port=${OPTARG} ;;
                                        h) host=${OPTARG} ;;
                                        u) user=${OPTARG} ;;
                                        U) action=update ;;
                                        n) alias=${OPTARG} ;;
                                        i) key_id=${OPTARG} ;;
                                esac
    done
    deletessh $alias 
    echo $alias 
    addHostCnfig $1 $2 $3 $4 $5 
    
}
