source ../source.sh

aliasSrc=$aliasDir/../aliasSource/git.sh
aliasLnk=$aliasDir/git.sh

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
