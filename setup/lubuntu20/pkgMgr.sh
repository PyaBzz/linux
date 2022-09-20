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
        pkgMgrFetchList
        pkgMgrInstall $pkg
    else
        echo "Skipped $pkg"
    fi
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
