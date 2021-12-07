source ../../source.sh

lxqtSrcDir="./$hostName/lxqt"
lxqtSources=($(ls $lxqtSrcDir/*.conf))
lxqtTargetDir=$HOME/.config/lxqt

openboxSrcFile="./$hostName/openbox/rc.xml"
openboxTargetDir="$HOME/.config/openbox"
openboxTargetFile="$openboxTargetDir/rc.xml"

applyToLocal() {
    mkdir -p $lxqtTargetDir
    copyToDirMulti lxqtSources $lxqtTargetDir

    mkdir -p $openboxTargetDir
    copy $openboxSrcFile $openboxTargetFile
}

takeFromLocal() {
    mkdir -p $lxqtSrcDir
    cp $lxqtTargetDir/*.conf $lxqtSrcDir

    copy $openboxTargetFile $openboxSrcFile
}
