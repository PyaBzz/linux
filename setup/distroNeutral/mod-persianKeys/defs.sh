source ../../source.sh

packageName="persian keyboard layout fix"
myLayoutFile=$(getCallingScriptDir)/ir # Cannot use ./ for ln
localLayoutFile=/usr/share/X11/xkb/symbols/ir

apply() {
    backUp $localLayoutFile
    sudo ln -sf $myLayoutFile $localLayoutFile
    # To apply layout changes without a restart: setxkbmap -layout ir
}
