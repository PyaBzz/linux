source ../../source.sh

packageName="xscreensaver-gl"
sourceFile=./.xscreensaver
targetDIr=$HOME

if (askUserClear "Install $packageName?"); then
    sudo apt-get update
    echo "Installing $packageName"
    sudo apt-get install $packageName
    copyFile $sourceFile to $targetDIr
else
    echo "Skipped $packageName"
fi
