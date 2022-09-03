source ../source.sh

packageName=".NET Core SDK 3.1 and runtime"
downloadUrl="https://packages.microsoft.com/config/ubuntu/19.10/packages-microsoft-prod.deb"
downloadedFile="$HOME/Downloads/packages-microsoft-prod.deb"

if (askUserClear "Install $packageName?"); then
    wget $downloadUrl -O $downloadedFile
    sudo dpkg -i $downloadedFile
    sudo apt-get update
    sudo apt-get install -y apt-transport-https
    sudo apt-get update
    sudo apt-get install -y dotnet-sdk-3.1
    sudo apt-get install -y dotnet-runtime-3.1
    rm $downloadedFile
else
    echo "Skipped $packageName"
fi
