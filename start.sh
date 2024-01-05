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

grep -e "id" -e "name" -e "gender" -e "image" -e "access" -e "Formate" -e "number" -e "Code" -e "carrier" -e "type" -e "address" -e "city" -e "timeZone" -e "service" -e "caption" -e "num" -e "spam" -e "num" -e "top" /Assets/log.txt > Assets/fil.txt

