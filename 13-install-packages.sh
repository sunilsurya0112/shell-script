#!/bin/bash

ID=$(id -u)

R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[0m"

TIMESTAMP=$(date +%F-%H-%M-%S)
LOGFILE="/tmp/$0-$TIMESTAMP.log"

echo "script started executing at $TIMESTAMP" &>> $LOGFILE

VALIDATE(){
       if [ $1 -ne 0 ]
        then 
                 echo -e "$2 ..is $R FAILED$N"
        else 
                 echo -e "$2  .. is $G SUCCESS$N"
       fi 


}


if [ $ID -ne 0 ]
then 
    echo -e " $R you are not root user"
    exit 1

else
    echo -e "$G you are root user"
fi
#echo "All arguments passed: $@"
# git mysql postfix net-tools
# package=git for first time
for package in $@
  do  
    yum list installed $package &>> $LOGFILE
    if [ $? -ne 0 ]
    then
        yum install $package -y &>> $LOGFILE
        VALIDATE $? "Installation of $package"
    else
        echo -e "$package $Y is already installed,so skipping." 


    fi
  done
