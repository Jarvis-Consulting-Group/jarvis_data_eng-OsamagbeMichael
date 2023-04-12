#! /bin/bash

psql_host=$1
port=$2
db_name=$3
user_name=$4
password=$5

if [ "$#" -ne 5 ]; then
	echo "Illegal number of parameters"
	exit 1
fi

lscpu_out=`lscpu`

get_hostname(){
	hostname=$(hostname -f)
}

get_cpu_number(){
 cpu_number=$(echo "$lscpu_out"  | egrep "^CPU\(s\):" | awk '{print $2}' | xargs) 
}

