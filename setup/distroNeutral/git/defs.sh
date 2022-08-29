source ../../source.sh

aliases() {
    local aliasSrc=$aliasDir/../aliasSource/git.sh
    local aliasLnk=$aliasDir/git.sh
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
