source ../source.sh

installVsCode() {
    mkdir -p $downloadsDir
    repoLocal=$downloadsDir/vscode
    mkdir -p $repoLocal

    repoUrl=https://AUR.archlinux.org/visual-studio-code-bin.git

    git clone $repoUrl $repoLocal
    cd $repoLocal
    makepkg -sri # automatically runs `pacman -U ...`
    rm -rf $repoLocal
}

installKeyRing() {
    sudo pacman -S gnome-keyring libsecret
}
