source ../../source.sh

packageName="LXQT Mod"
if (askUserClear "Apply $packageName?"); then
    :
else
    echo "Aborted"
    exit 1
fi

sources=($(ls *.conf))
targetDir=$HOME/.config/lxqt
mkdir -p $targetDir

backupAndReplaceToDir sources to $targetDir

echo "Applied"
