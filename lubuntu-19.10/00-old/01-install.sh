#=================  Install  =================

#_________________  Apt  _________________
sudo apt update

for packageName in \
    keepass2; do
    clear
    printLine 60 "#"
    if (askUser "Install $packageName?"); then
        echo "Installing $packageName"
        sudo apt install $packageName
    else
        echo "Skipped $packageName ..."
    fi
done

#_________________  Misc Repos  _________________

clear
printLine 60 "#"
packageName="MS SQL server"
if (askUser "Install $packageName?"); then
    wget -qO- https://packages.microsoft.com/keys/microsoft.asc | sudo apt-key add -
    sudo add-apt-repository "$(wget -qO- https://packages.microsoft.com/config/ubuntu/18.04/mssql-server-2019.list)"
    sudo apt-get update
    sudo apt-get install -y mssql-server
    sudo /opt/mssql/bin/mssql-conf setup
else
    echo "Skipped $packageName ..."
fi
