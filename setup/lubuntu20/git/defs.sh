source ../source.sh

aliasSrc=$aliasDir/../aliasSource/git.sh
aliasLnk=$aliasDir/git.sh

# install() {
#     local pkg=$1
#     if (askUserClear "Install $pkg?"); then
#         sudo apt update
#         sudo apt install -y $pkg
#     else
#         echo "Skipped $pkg"
#     fi
# }

aliases() {
    if (isBashNotModded); then
        echo "Skipped aliases. Prerequisite: bashMod"
        return
    fi
    ln -sf $aliasSrc $aliasLnk
}

userConfigs() {
    git config --global user.name pyabzz
    git config --global user.email ""
    git config --global init.defaultBranch main
}
