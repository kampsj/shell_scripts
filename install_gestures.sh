#!/bin/bash
clear
echo "--------------------------------------------------------------------------"
echo "- Installing mouse gestures"
echo "--------------------------------------------------------------------------"
echo

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


echo "Clone repository"
git clone https://github.com/bulletmark/libinput-gestures.git
check_exit_status;
echo "Make."
sudo ./libinput-gestures/libinput-gestures-setup install
check_exit_status;
echo "Enable and autostart"
libinput-gestures/libinput-gestures-setup autostart
check_exit_status;
libinput-gestures/libinput-gestures-setup start
check_exit_status;
echo "Done."
echo
echo "Install GUI"
echo "Clone repository"
git clone https://gitlab.com/cunidev/gestures
check_exit_status;
echo "Run setup script"
sudo python3 $PWD/gestures/setup.py install
check_exit_status;

echo "--------------------------------------------------------------------------"
echo "- Done."
echo "--------------------------------------------------------------------------"
echo