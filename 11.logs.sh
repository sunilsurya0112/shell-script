#!/bin/bash


ID=$(id -u)

TIMESTAMP=$(date +%F-%H-%M-%S)

R="\e[31m"
G="\e[32m"
N="\e[0m"

LOGFILE="/home/sunil/$0-$TIMESTAMP.log"

VALIDATE(){
    if [ $1 -ne 0 ]
    then    
        echo "$2 is $R failed $N"
        exit 1 #other than zero
    else
        echo "$2 is $G Success $N"
    fi     

}


if [ $ID -ne 0 ]
then
    echo "you are not root user"
    #exit 34
else
    echo "you are root user"    
fi # fi means reverse of if , indicating condition end

apt-get install mysqlhfh-server -y >> $LOGFILE

VALIDATE $? "Mysql installation"

apt-get install git -y >> $LOGFILE

VALIDATE $? "git installation" 