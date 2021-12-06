source ../../source.sh

lxqtSrcDir="./$hostName/lxqt"
lxqtSources=($(ls $lxqtSrcDir/*.conf))
# lxqtTargetDir=$HOME/.config/lxqt
lxqtTargetDir="./scratchDir/lxqt"

openboxSrcFile="./$hostName/openbox/rc.xml"
# openboxTargetDir="$HOME/.config/openbox"
openboxTargetDir="./scratchDir/openbox"
openboxTargetFile="./scratchDir/openbox/rc.xml"

applyToLocal() {
    mkdir -p $lxqtTargetDir
    copyToDirMulti lxqtSources to $lxqtTargetDir

    mkdir -p $openboxTargetDir
    copy $openboxSrcFile to $openboxTargetFile
}

takeFromLocal() {
    mkdir -p $lxqtSrcDir
    cp $lxqtTargetDir/*.conf $lxqtSrcDir

    copy $openboxTargetFile to $openboxSrcFile
}
