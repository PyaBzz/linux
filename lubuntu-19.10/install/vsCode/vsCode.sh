source ../../../bashSource/functions.sh

clear
printLine 60 "#"
packageName="VS Code"
if (askUser "Install $packageName?"); then
    echo "Installing $packageName"
    sudo snap install --classic code
    cp ./settings.json ~/.config/Code/User
else
    echo "Skipped $packageName"
fi
