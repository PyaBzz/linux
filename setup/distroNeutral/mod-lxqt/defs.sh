source ../../source.sh

myDir=$(getMyDir) # Cannot use ./ for symlinks
lxqtMyDirBase="$myDir/$hostName"
lxqtMyDir="$lxqtMyDirBase/lxqt"
lxqtLocalDir=$HOME/.config/lxqt

openboxMyFile="$myDir/$hostName/openbox/rc.xml"
openboxLocalFile="$HOME/.config/openbox/rc.xml"

bazIcon="$mediaDir/baz.png"
iconFile=$HOME/.face.png

apply() {
    if (dirExists $lxqtLocalDir); then
        backUp $lxqtLocalDir --verbose
        cp -r $lxqtLocalDir $lxqtMyDirBase
        rm -rf $lxqtLocalDir
    fi
    ln -sf $lxqtMyDir $lxqtLocalDir

    backUp $openboxLocalFile
    ln -sf $openboxMyFile $openboxLocalFile

    ln -sf $bazIcon $iconFile
}
