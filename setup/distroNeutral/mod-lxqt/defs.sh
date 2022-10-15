source ../../source.sh

lxqtPayloadDirBase="$(getMyDir)/$hostName" # Cannot use ./ for symlinks
lxqtPayloadDir="$lxqtPayloadDirBase/lxqt"
lxqtLocalDir=$HOME/.config/lxqt

bazIcon="$mediaDir/baz.png"
iconFile=$HOME/.face.png

apply() {
    if (dirExists $lxqtLocalDir); then
        backUp $lxqtLocalDir --verbose
        cp -r $lxqtLocalDir $lxqtPayloadDirBase
        rm -rf $lxqtLocalDir
    fi
    ln -sf $lxqtPayloadDir $lxqtLocalDir

    ln -sf $bazIcon $iconFile
}
