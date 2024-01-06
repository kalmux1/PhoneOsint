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


# "Checking and Installing Required Dependencies"


# Checking for pip
pip_chk=$(which pip)
if [[ $? != 0 ]]
then
    # Insatlling pip if not installed
    pip=$(sudo apt-get install pip -y)   
fi
# Checking for Trucallerpy
src_chk=$(which truecallerpy)
if [[ $? != 0 ]]
then
    # Insatlling Truecallerpy if not installed
    src=$(sudo pip install truecallerpy)
fi
# Checking for wget
wget_chk=$(which wget)
if [[ $? != 0 ]]
then
    # Insatlling wget if not installed
    dnl=$(sudo apt-get install wget)
fi


# Checking For Login ID

login=$(truecallerpy --installationid)
if [[ $? != 0 ]]
then
    dnl=$(truecallerpy login)
else 
    echo "
    "
    path=$(pwd)
    # Taking Phone Number as Input From User
    read -e -p $'\033[1;95m Enter a phone number :- \033[0m' num
    # Checking Length of Number
    len=${#num}
    if [[ $len -gt 10 ]]
    then 
        # If Number is Invalid Then exiting
        echo " "
        echo -e "$BIRed         Invalid Number $Normal "
        exit 1
    else
        if [[ ! -d $path/Assets ]]
        then 
            # Making directory for storing tools files and logs
            mkdir $path/Assets
        fi
        # Gathering Information of the number via Trucallerpy and storing it in log.txt
        truecallerpy -e -n -s $num > Assets/log.txt
        # Extracting Requiered output and storing it in fil.txt
        grep -w -e "id" -e "name" -e "gender" -e "access" -e "e164Formate" -e "numberType" -e "nationalFormat" -e "dialingCode" -e "carrier" -e "type" -e "spamScore" -e "spamType" -e "address" -e "city" -e "countryCode" -e "timeZone" -e "service" -e "caption" -e "numReports" -e "numReports60days" -e"numSearches60days" -e "numCalls60days" -e "numMessages60days" -e "type" Assets/log.txt > Assets/fil.txt
        # Removing Unessasary Special Characters From The extracted file and storing it in sym.txt
        sed 's/[^[:alnum:][:space:]]//g' Assets/fil.txt > Assets/sym.txt
        # Formating final data of the number and storing it in num.txt
        awk '{print "    ",$1," ===> ",$2}' Assets/sym.txt > Assets/num.txt
        # Printing final information 
        echo -e "$BIGreen"
        head -n -2 Assets/num.txt
        echo -e "$Normal"
        # Extracting image link data from the log.txt
        grep -e "image" Assets/log.txt > Assets/img.txt || exit 1
        # Storing main link into image.txt
        cmd=$(awk '{print $2}' Assets/img.txt > Assets/image.txt)
        # Removing "" from the link
        image=$(tr '" ,' ' ' < Assets/image.txt )
        sleep 2s
        echo " "
        # Downloading the image
        echo -e "$BIBlue Downloading The Profile Image $Normal"
        echo -e "$Orange"
        # Storing image in image.png 
        wget -O image.png --no-verbose --show-progress --quiet $image
        echo -e "$Normal"
        # image msg
        echo -e "$BIBlue You Can Check Image in the PhoneOsint Directory $Normal"

    fi
fi

        echo " "
        echo " "
        echo -e "$BIYellow Visit to my github for more hacking tools https://github.com/kalmux1"
        echo -e "                  Thanks for using this tool                        "
        echo -e "                         Hack daily                                $Normal"