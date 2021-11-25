source ../../../source.sh

askToProceed "Install nVidia drivers?"

if (isArch); then
    echo "!!! Read the comments in the bash file to continue !!!"
    # Download proprietary drivers from nvidia website for Quadro P2000.
    # Those have much better performance!
    # Then copy the blacklist.conf file to /etc/modprobe.d/blacklist.conf
    # Then add these to /etc/pacman.conf in the ignore section: nvidia
    # Then do these two lines:
    # askToProceed "Install nVidia settings front-end?"
    # pkgMgrInstall "nvidia-settings"
    

elif (isUbuntu); then
    sudo add-apt-repository ppa:graphics-drivers/ppa
    sudo apt update

    echo "!!! Read the comments in the bash file to continue !!!"
    #  Use these commands to determine the latest package:
    #  sudo apt list nvidia-driver-*
    #  sudo ubuntu-drivers devices

    #  Then do something like this to install: sudo apt install -y nvidia-driver-460
    #  Use nVidia X Server Settings to fix screen tearing
fi
