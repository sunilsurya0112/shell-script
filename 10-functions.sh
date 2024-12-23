#!/bin/bash


ID=$(id -u)

VALIDATE(){
    if [ $1 -ne 0 ]
    then    
        echo "$2 is failed"
        exit 1 #other than zero
    else
        echo "$2 is Success"
    fi     

}


if [ $ID -ne 0 ]
then
    echo "you are not root user"
    exit 34
else
    echo "you are root user"    
fi # fi means reverse of if , indicating condition end

yum install mysql -y

VALIDATE $? "Mysql installation"

yum install git -y

VALIDATE $? "git installation"

