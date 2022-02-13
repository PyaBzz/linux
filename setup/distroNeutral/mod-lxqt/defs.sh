source ../../source.sh

lxqtMyDirBase="$(getCallingScriptDir)/$hostName" # Cannot use ./ for symlinks
lxqtMyDir="$lxqtMyDirBase/lxqt"
lxqtLocalDir=$HOME/.config/lxqt
bazButtonIcon="./.face.png" # Todo: symlink this as well!

openboxMyFile="$(getCallingScriptDir)/$hostName/openbox/rc.xml"
openboxLocalFile="$HOME/.config/openbox/rc.xml"

apply() {
    if (dirExists $lxqtLocalDir); then
        backUp $lxqtLocalDir --verbose
        cp -r $lxqtLocalDir $lxqtMyDirBase
        rm -rf $lxqtLocalDir
    fi
    ln -sf $lxqtMyDir $lxqtLocalDir

    backUp $openboxLocalFile
    ln -sf $openboxMyFile $openboxLocalFile

    cp $bazButtonIcon $HOME
}
