source ../../bashSource/functions.sh

sudo apt-get update

clear
printLine 60 "#"
packageName="git"
if (askUser "Install $packageName?"); then
    echo "Installing $packageName"
    sudo apt-get install $packageName
    git config --global user.name pyabzz
    git config --global user.email ""
    #===================  Add Aliases  ===================
    echo "alias gistatus='clear && git status'" >> ../../bashMod/bashrcSrcDynamic.sh
    echo "alias giff='clear && git diff'" >> ../../bashMod/bashrcSrcDynamic.sh
    echo "alias gadd='clear && git add -p'" >> ../../bashMod/bashrcSrcDynamic.sh
else
    echo "Skipped $packageName"
fi
