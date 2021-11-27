source ../../source.sh

srcFile=./retroarch.cfg
targetFile=~/.config/retroarch/retroarch.cfg

applyConfig() {
    backupAndReplaceFile $srcFile to $targetFile
}
