source ../../../bash/extension/imports.sh

packageName="Dropbox"
downloadedArchive=~/Downloads/Dropbox.tar.gz
desktopShortcut=./dropbox.desktop

if (askUserClear "Install $packageName"); then
    wget "https://www.dropbox.com/download?plat=lnx.x86_64" -O $downloadedArchive
    tar xzf $downloadedArchive -C ~
    cp $desktopShortcut ~/Desktop
    rm $downloadedArchive
else
    echo "Skipped $packageName"
fi
