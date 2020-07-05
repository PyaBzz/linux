source ../bashSource/functions.sh

clear
printLine 60 "#"
packageName="blueman"
if (askUser "Install $packageName?"); then

    sudo apt-get update
    echo "Installing $packageName"
    sudo apt-get install $packageName
else
    echo "Skipped $packageName"
fi
