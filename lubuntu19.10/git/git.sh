source ../../bashExtension/imports.sh

packageName="git"
aliasesDirPath=~/.bashMod/aliases

if (askUserClear "Install $packageName?"); then
    sudo apt-get update
    echo "Installing $packageName"
    sudo apt-get install $packageName
    echo "$packageName installed"
else
    echo "Skipped $packageName"
fi

packageName="aliases"
if (askUser "Apply $packageName?"); then
    copyFile ./alias to $aliasesDirPath/git.sh
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
