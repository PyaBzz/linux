source ../../bashSource/functions.sh

clear
printLine 60 "#"
packageName="xscreensaver-gl"
if (askUser "Install $packageName?"); then
    sudo apt-get update
    echo "Installing $packageName"
    sudo apt-get install $packageName
    cp ./.xscreensaver ~
else
    echo "Skipped $packageName"
fi
