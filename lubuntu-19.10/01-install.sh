#=================  Install  =================

#_________________  Apt-Get  _________________
sudo apt-get update

for packageName in \
git
do
    clear
    printLine 60 "#"
    if (askUser "Install $packageName?") then
        echo "Installing $packageName"
        sudo apt-get install $packageName
    else
        echo "Skipped $packageName ..."
    fi
done

#_________________  Apt  _________________
sudo apt update

for packageName in \
keepass2
do
    clear
    printLine 60 "#"
    if (askUser "Install $packageName?") then
        echo "Installing $packageName"
        sudo apt install $packageName
    else
        echo "Skipped $packageName ..."
    fi
done

#_________________  Snap  _________________

clear
printLine 60 "#"
if (askUser "Install VisualStudio Code?") then
    echo "Installing VisualStudio Code"
    sudo snap install --classic code
else
    echo "Skipped VisualStudio Code ..."
fi

#_________________  Direct Download  _________________

clear
printLine 60 "#"
if (askUser "Install Google Chrome?") then
    wget -O ~/Downloads/GoogleChrome.deb https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
    sudo apt install ~/Downloads/GoogleChrome.deb
    rm -rf ~/Downloads/*.*
else
    echo "Skipped Google Chrome ..."
fi

clear
printLine 60 "#"
if (askUser "Install Dropbox?") then
    wget -O ~/Downloads/Dropbox.tar.gz "https://www.dropbox.com/download?plat=lnx.x86_64"
    tar xzf ~/Downloads/Dropbox.tar.gz -C ~
    ~/.dropbox-dist/dropboxd
else
    echo "Skipped Dropbox ..."
fi
