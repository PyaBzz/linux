pkgMgrUpdate() {
    sudo apt update
}

pkgMgrInstall() {
    local pkg=$1
    echo "Installing $pkg"
    sudo apt install -y $pkg
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

# pkgMgrAskInstallMulti() {
#     local pkgs=("$@")
#     clear
#     pkgMgrUpdate
#     for pkg in ${pkgs[@]}; do
#         if (askUser "Install $pkg?"); then
#             pkgMgrInstall $pkg
#         else
#             echo "Skipped $pkg"
#         fi
#     done
# }
