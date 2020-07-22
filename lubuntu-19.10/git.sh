source ../bashSource/functions.sh

clear
printLine 60 "#"
packageName="git"
if (askUser "Install $packageName?"); then

    sudo apt-get update
    echo "Installing $packageName"
    sudo apt-get install $packageName

    if (askUser "Apply config?"); then
        git config --global user.name pyabzz
        git config --global user.email ""
        echo "alias gistatus='clear && git status'" >>../bashMod/bashrcSrcDynamic.sh
        echo "alias giff='clear && git diff'" >>../bashMod/bashrcSrcDynamic.sh
        echo "alias gadd='clear && git add -p'" >>../bashMod/bashrcSrcDynamic.sh
        echo "alias getch='clear && git fetch'" >>../bashMod/bashrcSrcDynamic.sh
        echo "alias gull='clear && git pull'" >>../bashMod/bashrcSrcDynamic.sh
        echo "alias gush='clear && git push'" >>../bashMod/bashrcSrcDynamic.sh
        echo "alias geckout='clear && git checkout'" >>../bashMod/bashrcSrcDynamic.sh
        echo "alias gistash='clear && git stash'" >>../bashMod/bashrcSrcDynamic.sh
        echo "alias granch='clear && git branch'" >>../bashMod/bashrcSrcDynamic.sh
    else
        echo "Skipped config"
    fi
else
    echo "Skipped $packageName"
fi
