source ../../source.sh

aliases() {
    local aliasFile=$(getMyDir)/alias # Cannot use ./ for symlinks
    if (isBashNotModded); then
        echo "Skipped aliases. Prerequisite: bashMod"
        return
    fi
    ln -sf $aliasFile $aliasDir/git.sh
}

userConfigs() {
    git config --global user.name pyabzz
    git config --global user.email ""
    git config --global init.defaultBranch main
}
