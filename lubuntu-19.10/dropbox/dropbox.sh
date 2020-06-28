source ../../bashSource/functions.sh

clear
printLine 60 "#"
packageName="Dropbox"
if (askUser "Install $packageName"); then
    wget "https://www.dropbox.com/download?plat=lnx.x86_64" -O ~/Downloads/Dropbox.tar.gz
    tar xzf ~/Downloads/Dropbox.tar.gz -C ~
    cp ./dropbox.desktop ~/Desktop
else
    echo "Skipped $packageName"
fi
