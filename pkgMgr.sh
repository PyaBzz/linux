myDistro() { tr ' ' '\n' </etc/issue | head -n1; }
isArch() { [ $(myDistro) = "Arch" ]; }
isUbuntu() { [ $(myDistro) = "Ubuntu" ]; }

pkgMgrUpdate() {
    if (isArch); then
        sudo pacman -Syy
    elif (isUbuntu); then
        sudo apt update
    else
        echo "Unknown distro"
    fi
}

pkgMgrInstall() {
    local pkg=$1
    echo "Installing $pkg"
    if (isArch); then
        sudo pacman -S --noconfirm $pkg
    elif (isUbuntu); then
        sudo apt install $pkg
    else
        echo "Unknown package manager"
    fi
    echo "Installed $pkg"
}

pkgMgrAskInstall() {
    local pkg=$1
    if (askUserClear "Install $pkg?"); then
        pkgMgrUpdate
        pkgMgrInstall $pkg
    else
        echo "Skipped $pkg"
    fi
}
