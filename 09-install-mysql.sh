#!/bin/bash

ID=$(id -u)

if [ $ID -ne 0 ]
then
    echo "you are not root user"
    exit 34
else
    echo "you are root user"    
fi    

yum install git -y

if [ $? -ne 0 ]
then    
    echo "Error: Installing git is failed"
    exit 1 #other than zero
else
    echo "installing Git is Success"
fi        


yum install mysql -y

if [ $? -ne 0 ]
then    
    echo "Error: Installing mysql is failed"
    exit 1 #other than zero
else
    echo "installing mysql is Success"
fi        