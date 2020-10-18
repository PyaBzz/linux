source ../../bashMod/functions.sh

clear
printLine 60 "#"
packageName="git"
aliasesDirPath=~/.bashMod/aliases

if (askUser "Install $packageName?"); then
    sudo apt-get update
    echo "Installing $packageName"
    sudo apt-get install $packageName
else
    echo "Skipped $packageName"
fi

if (askUser "Apply config?"); then
    # git config --global user.name pyabzz
    # git config --global user.email ""
    cp ./alias $aliasesDirPath/git.sh
else
    echo "Skipped config"
fi
