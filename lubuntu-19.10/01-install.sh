#=================  Install  =================

#_________________  Apt-Get  _________________
sudo apt-get update

for packageName in \
    git; do
    clear
    printLine 60 "#"
    if (askUser "Install $packageName?"); then
        echo "Installing $packageName"
        sudo apt-get install $packageName
    else
        echo "Skipped $packageName ..."
    fi
done

clear
printLine 60 "#"
packageName="pulseaudio-equalizer"
if (askUser "Install $packageName?"); then
    sudo apt-get install $packageName
    cp source/pulseaudio-eq.desktop ~/Desktop
    cp /usr/share/applications/pavucontrol-qt.desktop ~/Desktop
else
    echo "Skipped $packageName ..."
fi

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

clear
printLine 60 "#"
packageName="virtualbox"
if (askUser "Install $packageName?"); then
    wget -q https://www.virtualbox.org/download/oracle_vbox_2016.asc -O- | sudo apt-key add -
    sudo add-apt-repository "deb [arch=amd64] http://download.virtualbox.org/virtualbox/debian $(lsb_release -cs) contrib"
    sudo apt update
    sudo apt install $packageName
else
    echo "Skipped $packageName ..."
fi

#_________________  Snap  _________________

clear
printLine 60 "#"
if (askUser "Install VisualStudio Code?"); then
    echo "Installing VisualStudio Code"
    sudo snap install --classic code
else
    echo "Skipped VisualStudio Code ..."
fi

#_________________  Misc Repos  _________________

clear
printLine 60 "#"
if (askUser "Install MS SQL server?"); then
    wget -qO- https://packages.microsoft.com/keys/microsoft.asc | sudo apt-key add -
    sudo add-apt-repository "$(wget -qO- https://packages.microsoft.com/config/ubuntu/18.04/mssql-server-2019.list)"
    sudo apt-get update
    sudo apt-get install -y mssql-server
    sudo /opt/mssql/bin/mssql-conf setup
else
    echo "Skipped Google Chrome ..."
fi

#_________________  Direct Download  _________________

clear
printLine 60 "#"
if (askUser "Install Google Chrome?"); then
    wget -O ~/Downloads/GoogleChrome.deb https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
    sudo apt install ~/Downloads/GoogleChrome.deb
    rm -rf ~/Downloads/*.*
else
    echo "Skipped Google Chrome ..."
fi

clear
printLine 60 "#"
if (askUser "Install Dropbox?"); then
    wget -O ~/Downloads/Dropbox.tar.gz "https://www.dropbox.com/download?plat=lnx.x86_64"
    tar xzf ~/Downloads/Dropbox.tar.gz -C ~
    ~/.dropbox-dist/dropboxd
else
    echo "Skipped Dropbox ..."
fi
