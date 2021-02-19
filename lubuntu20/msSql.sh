source ../source.sh

packageName="MS SQL server"
aptKeyUrl="https://packages.microsoft.com/keys/microsoft.asc"
repoEntryUrl="wget -qO- https://packages.microsoft.com/config/ubuntu/18.04/mssql-server-2019.list"

# Use "sa" and "adminPass1" at server setup step

if (askUserClear "Install $packageName?"); then
    wget -qO- $aptKeyUrl | sudo apt-key add -
    sudo add-apt-repository "$(wget -qO- $repoEntryUrl)"
    sudo apt-get update
    sudo apt-get install -y mssql-server
    sudo /opt/mssql/bin/mssql-conf setup
else
    echo "Aborted"
fi
