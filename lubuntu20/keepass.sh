source ../source.sh

packageName="keepass2"

if (askUserClear "Install $packageName?"); then
    sudo apt update
    echo "Installing $packageName"
    sudo apt install -y $packageName
else
    echo "Skipped $packageName"
fi
