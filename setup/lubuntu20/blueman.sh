source ../source.sh

packageName="blueman"

if (askUserClear "Install $packageName?"); then

    sudo apt-get update
    echo "Installing $packageName"
    sudo apt-get install $packageName
else
    echo "Skipped $packageName"
fi
