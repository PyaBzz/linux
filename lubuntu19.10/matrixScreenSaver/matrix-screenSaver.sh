source ../../bashMod/functions.sh

packageName="xscreensaver-gl"

if (askUserClear "Install $packageName?"); then
    sudo apt-get update
    echo "Installing $packageName"
    sudo apt-get install $packageName
    cp ./.xscreensaver ~
else
    echo "Skipped $packageName"
fi
