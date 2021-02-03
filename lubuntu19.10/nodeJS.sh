source ../../bash/extension/imports.sh

packageName="nodejs"

if (askUserClear "Install $packageName?"); then
    sudo apt update
    echo "Installing $packageName"
    sudo apt install $packageName

    packageName="npm"
    sudo apt install $packageName
    sudo npm install -g n
    sudo n stable
else
    echo "Skipped $packageName"
fi
