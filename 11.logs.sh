#!/bin/bash


ID=$(id -u)

TIMESTAMP=$(date +%F-%H-%M-%S)

LOG_FILE="/tmp/$0-$TIMESTAMP.log

echo "script name is: $0"

VALIDATE(){
    if [ $1 -ne 0 ]
    then    
        echo "$2 is failed"
        exit 1 #other than zero
    else
        echo "$1 is Success"
    fi     

}


if [ $1 -ne 0 ]
then
    echo "you are not root user"
    exit 34
else
    echo "you are root user"    
fi # fi means reverse of if , indicating condition end

apt install mysql-server -y &>> $LOGFILE

VALIDATE $? "Mysql installation"

apt install git -y &>> $LOGFILE

VALIDATE $? "git installation"

