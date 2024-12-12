#!/bin/bash

ID=$(id -u)

if [ $ID -ne 0 ]
then
    echo "you are not root user"
    exit 34
else
    echo "you are root user"    
fi    

apt-get install git -y