source ../bashSource/functions.sh

clear
printLine 60 "#"
packageName="Google Chrome"
if (askUser "Install $packageName?"); then
    wget -O ~/Downloads/GoogleChrome.deb https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
    sudo apt install ~/Downloads/GoogleChrome.deb
    rm -rf ~/Downloads/GoogleChrome.deb
else
    echo "Skipped $packageName ..."
fi
