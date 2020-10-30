source ../bashMod/functions.sh

packageName="virtualbox"

if (askUserClear "Install $packageName?"); then

    wget -q https://www.virtualbox.org/download/oracle_vbox_2016.asc -O- | sudo apt-key add -
    sudo add-apt-repository "deb [arch=amd64] http://download.virtualbox.org/virtualbox/debian $(lsb_release -cs) contrib"
    sudo apt update
    sudo apt install $packageName
else
    echo "Skipped $packageName"
fi
