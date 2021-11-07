source ../../source.sh

packageName="nVidia drivers"
askToProceed "Install $package?"

if (isArch); then
    sudo pacman -S nvidia-lts
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
