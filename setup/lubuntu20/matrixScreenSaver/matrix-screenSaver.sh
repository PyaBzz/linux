source ../../source.sh

# packageName="xscreensaver-gl"
packageName="Matrix Screensaver"
sourceFile=./.xscreensaver
targetDir=$HOME

if (askUserClear "Install $packageName?"); then
    # sudo apt-get update
    echo "Installing $packageName"
    # sudo apt-get install $packageName
    copy $sourceFile to $targetDir
else
    echo "Skipped $packageName"
fi
