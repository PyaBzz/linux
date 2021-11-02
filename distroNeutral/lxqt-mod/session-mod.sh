source ../../source.sh

packageName="LXQT Mod"
myFile=./session.conf
targetFile=$HOME/.config/lxqt/session.conf

if (askUserClear "Apply $packageName?"); then
    backupAndReplaceFile $myFile to $targetFile
else
    echo "Aborted"
fi
