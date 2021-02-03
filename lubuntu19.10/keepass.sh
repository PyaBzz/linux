source ../../bash/extension/imports.sh

packageName="keepass2"

if (askUserClear "Install $packageName?"); then
    sudo apt update
    echo "Installing $packageName"
    sudo apt install $packageName
else
    echo "Skipped $packageName"
fi
