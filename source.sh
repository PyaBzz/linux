myDir="$(readlink -f "$(cd "$(dirname "${BASH_SOURCE[0]}")" >/dev/null 2>&1 && pwd)")"
source $myDir/../bash/source.sh

myDistro() { tr ' ' '\n' </etc/issue | head -n1; }

isArch() { [ $(myDistro) = "Arch" ]; }

isUbuntu() { [ $(myDistro) = "Ubuntu" ]; }

packageManagerUpdate() {
    if (isArch); then
        "sudo pacman -Syy"
    elif (isUbuntu); then
        "sudo apt update"
    else
        "Unknown distro"
    fi
}
