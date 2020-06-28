source ../bashSource/functions.sh

sudo apt update

clear
printLine 60 "#"
packageName="keepass2"

if (askUser "Install $packageName?"); then
    echo "Installing $packageName"
    sudo apt install $packageName
else
    echo "Skipped $packageName"
fi
