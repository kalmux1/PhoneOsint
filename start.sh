#!/bin/bash

# This is a bash Script To provide information of a phone number 


echo " PhoneOsint"


echo "Installing Required packages"
echo "This might can take some time based on your internet speed"
src=$(pip install truecallerpy)
sleep 3s

read -p "Enter a phone number :- " num
mkdir Assets

truecallerpy -e -n -s $num > Assets/log.txt

grep -e "id" -e "name" -e "gender" -e "access" -e "Formate" -e "number" -e "Code" -e "carrier" -e "type" -e "address" -e "city" -e "timeZone" -e "service" -e "caption" -e "num" -e "spam" -e "num" -e "top" Assets/log.txt > Assets/fil.txt

sed 's/[^[:alnum:][:space:]]//g' Assets/fil.txt > Assets/sym.txt

awk '{print $1,"   :   ",$2}' Assets/sym.txt > Assets/num.txt

head -n -3 Assets/num.txt

grep -e "image" Assets/log.txt > Assets/img.txt
tr '"' ' ' < Assets/img.txt
image=$(awk '{print $2}' > Assets/img.txt)


img=$(curl $image --output Assets/image.png)


