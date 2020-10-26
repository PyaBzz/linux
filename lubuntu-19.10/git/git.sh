source ../../bashMod/functions.sh

clear
printLine 60 "#"
packageName="git"
aliasesDirPath=~/.bashMod/aliases

if (askUser "Install $packageName?"); then
    sudo apt-get update
    echo "Installing $packageName"
    sudo apt-get install $packageName
    echo "$packageName installed"
else
    echo "Skipped $packageName"
fi

packageName="aliases"
if (askUser "Apply $packageName?"); then
    addOrReplaceFile $aliasesDirPath/git.sh with ./alias
    echo "$packageName applied"
else
    echo "Skipped $packageName"
fi

packageName="global config"
if (askUser "Apply $packageName?"); then
    git config --global user.name pyabzz
    git config --global user.email ""
    echo "$packageName applied"
else
    echo "Skipped $packageName"
fi
