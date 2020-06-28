source ../../bashSource/functions.sh

clear
printLine 60 "#"
packageName="VS Code"
if (askUser "Install $packageName?"); then
    echo "Installing $packageName"
    sudo snap install --classic code

    if (askUser "Apply config?"); then
        if (dirMissing ~/.config/Code); then
            mkdir ~/.config/Code
        fi
        if (dirMissing ~/.config/Code/User); then
            mkdir ~/.config/Code/User
        fi
        cp ./settings.json ~/.config/Code/User
    else
        echo "Skipped config"
    fi
else
    echo "Skipped $packageName"
fi
