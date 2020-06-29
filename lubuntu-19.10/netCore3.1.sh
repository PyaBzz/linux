source ../../bashSource/functions.sh

clear
printLine 60 "#"
packageName=".NET Core SDK 3.1 and runtime"
if (askUser "Install $packageName?"); then
    wget https://packages.microsoft.com/config/ubuntu/19.10/packages-microsoft-prod.deb -O ~/Downloads/packages-microsoft-prod.deb
    sudo dpkg -i ~/Downloads/packages-microsoft-prod.deb
    sudo apt-get update
    sudo apt-get install apt-transport-https
    sudo apt-get update
    sudo apt-get install dotnet-sdk-3.1
    sudo apt-get install dotnet-runtime-3.1
else
    echo "Skipped $packageName"
fi