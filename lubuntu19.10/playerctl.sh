source ../bashExtension/imports.sh

packageName="playerctl"

if (askUserClear "Install $packageName?"); then
    sudo apt update
    echo "Installing $packageName"
    sudo apt install $packageName
else
    echo "Skipped $packageName"
fi
