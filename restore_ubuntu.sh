#!/bin/bash
clear
################################################################################
# Written By: "Jesse"
# Last update: 16-01-2020.
#===============================================================================
# Purpose:
#   This script is used to get a fresh (x)ubuntu install up to speed.
#
################################################################################

################################################################################
#   Define Variables
################################################################################

now=$(date +'%m/%d/%Y %r')

################################################################################
#   Define Functions
################################################################################
timestamp()
{
    now=$(date +'%m/%d/%Y %r')
}

check_exit_status()
{

    if [ $? -eq 0 ]
    then
        echo
        echo "Success"
        echo
    else
        echo
        echo "[ERROR] Process Failed!"
        echo

        read -p "The last command exited with an error. Exit script? (y/n) " ans

        if [ "$ans" == "y" ]
        then
            exit 1
        fi
    fi
}

reminder() 
{
echo "##########################################################################"
echo "# Theme/icon reminder"
echo "##########################################################################"
echo 
echo "Change the icon to Paper"
echo "Change the theme to Greybird-dark, also in the window manager"
echo
echo "##########################################################################"
echo "# Misc"
echo "##########################################################################"
echo 
echo "Run TLP"
echo 
echo "Change the video drivers to proprietary (if you haven't already)"
echo
echo "##########################################################################"
echo "# Mouse gestures"
echo "##########################################################################"
echo 
echo "Reboot the system now and run the install_gestures.sh script afterwards."
}

################################################################################
#   Main Processing
################################################################################
timestamp

echo "##########################################################################"
echo "# Setup process started by $USER on $now"
echo "##########################################################################"
echo

#-------------------------------------------------------------------------------
#   Make sure base system is up to date first.
#-------------------------------------------------------------------------------
echo "--------------------------------------------------------------------------"
echo "- apt update && upgrade"
echo "--------------------------------------------------------------------------"
echo

sudo apt-get update;
check_exit_status;
sudo apt-get upgrade;
check_exit_status;

echo "--------------------------------------------------------------------------"
echo "- Preparing mouse gestures"
echo "--------------------------------------------------------------------------"
echo
echo "Installing dependencies"
sudo apt install -y python3 python3-setuptools xdotool python3-gi libinput-tools python-gobject;
echo "Add user to input"
sudo gpasswd -a $USER input
check_exit_status;

echo "--------------------------------------------------------------------------"
echo "- Install paper theme"
echo "--------------------------------------------------------------------------"
echo

sudo apt-get install -y $PWD/paper-icon-theme_1.5.728-202003121505~daily~ubuntu18.04.1_all.deb;
check_exit_status;

echo "--------------------------------------------------------------------------"
echo "- Install zoom"
echo "--------------------------------------------------------------------------"
echo

wget -O ~/Downloads/zoom_x86_64.deb "https://zoom.us/client/latest/zoom_x86_64.deb";
check_exit_status;
echo
sudo apt-get install -y ~/Downloads/zoom_x86_64.deb;
check_exit_status;

echo
echo "--------------------------------------------------------------------------"
echo "- Install coding stuff"
echo "--------------------------------------------------------------------------"
echo
wget -O ~/Downloads/vscode.deb "https://code.visualstudio.com/docs/?dv=linux64_deb";
check_exit_status;
sudo apt-get install -y ~/Downloads/vscode.deb;
check_exit_status;
sudo snap install pycharm-community;
check_exit_status;
echo "--------------------------------------------------------------------------"
echo "- Install TLP"
echo "--------------------------------------------------------------------------"
echo

sudo apt install -y tlp;
sudo systemctl enable tlp;

echo "--------------------------------------------------------------------------"
echo "- Install Spotify"
echo "--------------------------------------------------------------------------"
echo

sudo snap install spotify;

echo "--------------------------------------------------------------------------"
echo "- Install Python stuff"
echo "--------------------------------------------------------------------------"
echo
sudo apt install -y python3-pip;
check_exit_status;
sudo apt install -y virtualenv;
check_exit_status;
sudo pip3 install ipython;
check_exit_status;

echo "--------------------------------------------------------------------------"
echo "- Install Docker"
echo "--------------------------------------------------------------------------"
echo
sudo apt install -y docker docker-compose;
check_exit_status;
echo "--------------------------------------------------------------------------"
echo "- Removing downloaded files"
echo "--------------------------------------------------------------------------"
echo
echo "Zoom..."
rm -f ~/Downloads/zoom_x86_64.rpm;
check_exit_status;
echo "VS Code..."
rm -f ~/Downloads/vscode.rpm;
check_exit_status;
reminder;

echo "##########################################################################"
echo "# Setup process ended by $USER on $now"
echo "##########################################################################"
echo