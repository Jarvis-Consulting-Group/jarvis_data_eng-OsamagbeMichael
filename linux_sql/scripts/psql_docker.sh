#! /bin/sh:

cmd=$1
db_username=$2
db_password=$3

sudo systemctl status docker || systemctl start docker


docker container inspect jrvs-psql
container_status=$?


case $cmd in 
  create)
  

 	  if [ $container_status -eq 0 ]; then
     		echo 'Container already exists'
     		exit 1	
  	  fi

  	
 	  if [ $# -ne 3 ]; then
     		echo 'Create requires username and password'
     		exit 1
  	  fi
  
          
  	  docker volume volume1
  	  
  	  docker run volume1
  	  
  	  exit $?
  	  ;;

  start|stop) 
  	
  	  echo $container_status

 
          if [ $container_status -ne 1 ]; then
  	  	echo 'blop blop'
		exit 1
  	  fi

  	 
  	 docker container $cmd jrvs-psql
 	 exit $?
  	;;	

esac 


