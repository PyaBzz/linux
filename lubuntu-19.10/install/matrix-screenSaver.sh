source ../../bashSource/functions.sh

sudo apt-get update

clear
printLine 60 "#"
packageName="xscreensaver-gl"
if (askUser "Install $packageName?"); then
    echo "Installing $packageName"
    sudo apt-get install $packageName
    cp ../source/.xscreensaver ~
else
    echo "Skipped $packageName"
fi
