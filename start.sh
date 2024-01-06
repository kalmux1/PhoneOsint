#!/bin/bash

# This is a bash Script To provide information of a phone number 


# Colour Db
# Reset
Normal='\033[0m'       # Text Reset

# Regular Colors
Black='\033[0;30m'        # Black
Red='\033[0;31m'          # Red
Green='\033[0;32m'        # Green
Yellow='\033[0;33m'       # Yellow
Blue='\033[0;34m'         # Blue
Purple='\033[0;35m'       # Purple
Cyan='\033[0;36m'         # Cyan
White='\033[0;37m'        # White
Orange='\033[0;33m'       # Orange


# Bold High Intensity
BIBlack='\033[1;90m'      # Black
BIRed='\033[1;91m'        # Red
BIGreen='\033[1;92m'      # Green
BIYellow='\033[1;93m'     # Yellow
BIBlue='\033[1;94m'       # Blue
BIPurple='\033[1;95m'     # Purple
BICyan='\033[1;96m'       # Cyan
BIWhite='\033[1;97m'      # White

# Banner

echo -e "$BIRed 


██████╗ ██╗  ██╗ ██████╗ ███╗   ██╗███████╗ ██████╗ ███████╗██╗███╗   ██╗████████╗
██╔══██╗██║  ██║██╔═══██╗████╗  ██║██╔════╝██╔═══██╗██╔════╝██║████╗  ██║╚══██╔══╝
██████╔╝███████║██║   ██║██╔██╗ ██║█████╗  ██║   ██║███████╗██║██╔██╗ ██║   ██║   
██╔═══╝ ██╔══██║██║   ██║██║╚██╗██║██╔══╝  ██║   ██║╚════██║██║██║╚██╗██║   ██║   
██║     ██║  ██║╚██████╔╝██║ ╚████║███████╗╚██████╔╝███████║██║██║ ╚████║   ██║   
╚═╝     ╚═╝  ╚═╝ ╚═════╝ ╚═╝  ╚═══╝╚══════╝ ╚═════╝ ╚══════╝╚═╝╚═╝  ╚═══╝   ╚═╝   V1.0     $Normal"
echo -e " $BICyan             _  _   _     ___ _  _     _                               
             /  |_) |_  /\  | |_ | \   |_) \_/   |/  /\  |  |\/| | | \/ 
             \_ | \ |_ /--\ | |_ |_/   |_)  |    |\ /--\ |_ |  | |_| /\ 
                                                           $Normal  "

echo -e " $BIYellow                         Installing Required packages
             This might can take some time based on your internet speed $Normal"


pip_chk=$(which pip)
if [[ $? != 0 ]]
then
    pip=$(sudo apt-get install pip -y)
fi

src_chk=$(which truecallerpy)
if [[ $? != 0 ]]
then
    src=$(sudo pip install truecallerpy)
fi

wget_chk=$(which wget)
if [[ $? != 0 ]]
then
    dnl=$(sudo apt-get install wget)
fi

login=$(truecallerpy --installationid)
if [[ $? != 0 ]]
then
    dnl=$(truecallerpy login)
else 
    echo "
    "
    path=$(pwd)
    read -e -p $'\033[1;95m Enter a phone number :- \033[0m' num

    len=${#num}
    if [[ $len -gt 10 ]]
    then 
        echo " "
        echo -e "$BIRed    Invalid Number $Normal "
    else
        if [[ ! -d $path/Assets ]]
        then 
            mkdir $path/Assets
        fi
        truecallerpy -e -n -s $num > Assets/log.txt

        grep -w -e "id" -e "name" -e "gender" -e "access" -e "e164Formate" -e "numberType" -e "nationalFormat" -e "dialingCode" -e "carrier" -e "type" -e "spamScore" -e "spamType" -e "address" -e "city" -e "countryCode" -e "timeZone" -e "service" -e "caption" -e "numReports" -e "numReports60days" -e"numSearches60days" -e "numCalls60days" -e "numMessages60days" -e "type" Assets/log.txt > Assets/fil.txt

        sed 's/[^[:alnum:][:space:]]//g' Assets/fil.txt > Assets/sym.txt

        awk '{print "    ",$1," ===> ",$2}' Assets/sym.txt > Assets/num.txt
        echo -e "$BIGreen"
        head -n -2 Assets/num.txt
        echo -e "$Normal"
        grep -e "image" Assets/log.txt > Assets/img.txt || exit 1

        cmd=$(awk '{print $2}' Assets/img.txt > Assets/image.txt)
        image=$(tr '" ,' ' ' < Assets/image.txt )

        sleep 2s
        echo " "
        echo -e "$BIBlue Downloading The Profile Image $Normal"
        echo -e "$Orange"
        wget -O image.png --no-verbose --show-progress --quiet $image
        echo -e "$Normal"

        echo -e "$BIBlue You Can Check Image in the PhoneOsint Directory $Normal"
    fi
fi