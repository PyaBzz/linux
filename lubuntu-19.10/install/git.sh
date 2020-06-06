source ../../bashSource/functions.sh

sudo apt-get update

clear
printLine 60 "#"
packageName="git"
if (askUser "Install $packageName?"); then
    echo "Installing $packageName"
    sudo apt-get install $packageName
    git config --global user.name pyabzz
    git config --global user.email ""
else
    echo "Skipped $packageName"
fi
