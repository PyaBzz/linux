source ../bashMod/functions.sh

clear
printLine 60 "#"
packageName="keepass2"

if (askUser "Install $packageName?"); then
    sudo apt update
    echo "Installing $packageName"
    sudo apt install $packageName
else
    echo "Skipped $packageName"
fi
