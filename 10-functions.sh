#!/bin/bash


ID=$(id -u)

VALIDATE(){
    if [ $? -ne 0 ]
    then    
        echo "Error: Installing git is failed"
        exit 1 #other than zero
    else
        echo "installing Git is Success"
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

VALIDATE

apt install git -y

VALIDATE

