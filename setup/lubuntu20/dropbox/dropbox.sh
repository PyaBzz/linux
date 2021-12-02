source ../../source.sh

packageName="Dropbox"
downloadUrl="https://www.dropbox.com/download?plat=lnx.x86_64"
downloadedFile=$HOME/Downloads/Dropbox.tar.gz
shortcut=./dropbox.desktop

if (askUserClear "Install $packageName"); then
    wget $downloadUrl -O $downloadedFile
    tar xzf $downloadedFile -C $HOME
    copy $shortcut to $desktopDir
    rm $downloadedFile
else
    echo "Aborted"
fi
