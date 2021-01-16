#!/bin/bash
clear
echo "--------------------------------------------------------------------------"
echo "- Installing mouse gestures"
echo "--------------------------------------------------------------------------"
echo
echo "Clone repository"
git clone https://github.com/bulletmark/libinput-gestures.git
echo "Make."
sudo ./libinput-gestures/libinput-gestures-setup install
echo "Enable and autostart"
libinput-gestures/libinput-gestures-setup autostart
libinput-gestures/libinput-gestures-setup start
echo "Done."
echo
echo "Install GUI"
echo "Clone repository"
git clone https://gitlab.com/cunidev/gestures
echo "Run setup script"
sudo python3 $PWD/gestures/setup.py install

echo "--------------------------------------------------------------------------"
echo "- Done."
echo "--------------------------------------------------------------------------"
echo