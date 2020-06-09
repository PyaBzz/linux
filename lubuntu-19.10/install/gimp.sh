source ../../bashSource/functions.sh

sudo apt-get update

clear
printLine 60 "#"
packageName="gimp"
if (askUser "Install $packageName?"); then
    echo "Installing $packageName"
    sudo apt-get install $packageName
else
    echo "Skipped $packageName"
fi
