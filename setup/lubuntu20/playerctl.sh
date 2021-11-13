source ../source.sh

packageName="playerctl"

if (askUserClear "Install $packageName?"); then
    sudo apt update
    echo "Installing $packageName"
    sudo apt install $packageName -y
else
    echo "Skipped $packageName"
fi
