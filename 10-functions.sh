#!/bin/bash


ID=$(id -u)

VALIDATE(){
    if [ $1 -ne 0 ]
    then    
        echo "$2 is failed"
        exit 1 #other than zero
    else
        echo "$1 is Success"
    fi     

}


if [ $ID -ne 0 ]
then
    echo "you are not root user"
    exit 34
else
    echo "you are root user"    
fi # fi means reverse of if , indicating condition end

apt install mysql-server -y

VALIDATE $? "Mysql installation"

apt install git -y

VALIDATE $? "git installation"

