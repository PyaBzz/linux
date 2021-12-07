source ../../source.sh

lxqtSrcDir="./$hostName/lxqt"
lxqtTargetDir=$HOME/.config/lxqt

openboxSrcDir="./$hostName/openbox"
openboxSrcFile="$openboxSrcDir/rc.xml"

openboxTargetDir="$HOME/.config/openbox"
openboxTargetFile="$openboxTargetDir/rc.xml"

applyToLocal() {
    mkdir -p $lxqtTargetDir
    cp $lxqtSrcDir/*.conf $lxqtTargetDir

    mkdir -p $openboxTargetDir
    cp $openboxSrcFile $openboxTargetFile
}

takeFromLocal() {
    mkdir -p $lxqtSrcDir
    cp $lxqtTargetDir/*.conf $lxqtSrcDir

    mkdir -p $openboxSrcDir
    cp $openboxTargetFile $openboxSrcFile
}
