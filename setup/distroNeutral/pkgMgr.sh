# myDistro() { tr ' ' '\n' </etc/issue | head -n1; }
# isArch() { [ $(myDistro) = "Arch" ]; }
# isUbuntu() { [ $(myDistro) = "Ubuntu" ]; }

# pkgMgrFetchList() {
#     if (isArch); then
#         sudo pacman -Syy
#     elif (isUbuntu); then
#         sudo apt update
#     else
#         echo "Unknown distro"
#     fi
# }

# pkgMgrInstall() {
#     local pkg=$1
#     echo "Installing $pkg"
#     if (isArch); then
#         sudo pacman -S --noconfirm $pkg
#     elif (isUbuntu); then
#         sudo apt install -y $pkg
#     else
#         echo "Unknown package manager"
#     fi
#     echo "Installed $pkg"
# }

# pkgMgrAskInstall() {
#     local pkg=$1
#     if (askUserClear "Install $pkg?"); then
#         pkgMgrFetchList
#         pkgMgrInstall $pkg
#     else
#         echo "Skipped $pkg"
#     fi
# }

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
