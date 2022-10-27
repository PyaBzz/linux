pkgMgrUpgradeSystem() {
    sudo pacman -Syu
}

pkgMgrFetchList() {
    sudo pacman -Syy
}

pkgMgrInstall() {
    local pkg=$1
    echo "Installing $pkg"
    pkgMgrFetchList
    sudo pacman -S --noconfirm $pkg
    echo "Installed $pkg"
}

pkgMgrAskInstall() {
    local pkg=$1
    if (askUserClear "Install $pkg?"); then
        pkgMgrInstall $pkg
    else
        echo "Skipped $pkg"
    fi
}

pkgMgrUpdateKeys() {
    sudo pacman -Sy archlinux-keyring
}

pkgMgrRemove() {
    local pkg=$1
    echo "Removing $pkg"
    sudo pacman -R --noconfirm $pkg
    echo "Removed $pkg"
}

# pkgMgrAskInstallMulti() {
#     local pkgs=("$@")
#     clear
#     pkgMgrFetchList
#     for pkg in ${pkgs[@]}; do
#         if (askUser "Install $pkg?"); then
#             pkgMgrInstall $pkg
#         else
#             echo "Skipped $pkg"
#         fi
#     done
# }
