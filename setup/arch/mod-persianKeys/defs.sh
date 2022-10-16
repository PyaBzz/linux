source ../../source.sh

packageName="persian keyboard layout fix"
myLayoutFile=$(getMyDir)/ir # Cannot use ./ for symlinks
localLayoutFile=/usr/share/X11/xkb/symbols/ir

apply() {
    backUp $localLayoutFile
    sudo ln -sf $myLayoutFile $localLayoutFile
    echo "To apply layout changes without a restart:"
    echo "setxkbmap -layout ir"
    echo "setxkbmap -layout gb"
}
