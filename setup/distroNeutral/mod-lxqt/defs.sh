source ../../source.sh

lxqtPayloadDirBase="$(getMyDir)/$hostName" # Cannot use ./ for symlinks
lxqtPayloadDir="$lxqtPayloadDirBase/lxqt"
lxqtLocalDir=$HOME/.config/lxqt

openboxMyFile="$(getMyDir)/$hostName/openbox/rc.xml" # Cannot use ./ for symlinks
openboxLocalFile="$HOME/.config/openbox/rc.xml"

bazIcon="$mediaDir/baz.png"
iconFile=$HOME/.face.png

apply() {
    if (dirExists $lxqtLocalDir); then
        backUp $lxqtLocalDir --verbose
        cp -r $lxqtLocalDir $lxqtPayloadDirBase
        rm -rf $lxqtLocalDir
    fi
    ln -sf $lxqtPayloadDir $lxqtLocalDir

    # backUp $openboxLocalFile
    ln -sfb $openboxMyFile $openboxLocalFile --suffix=.bazbak

    ln -sf $bazIcon $iconFile
}
