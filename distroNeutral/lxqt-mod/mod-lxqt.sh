source ../../source.sh

packageName="LXQT Mod"
if (askUserClear "Apply $packageName?"); then
    sourceFiles=(
        "./session.conf"
        "./panel.conf"
    )

    targetDir=$HOME/.config/lxqt
    mkdir -p $targetDir

    targetFiles=(
        "$targetDir/session.conf"
        "$targetDir/panel.conf"
    )

    backupAndReplaceFiles sourceFiles to targetFiles
else
    echo "Aborted"
    exit 1
fi

echo "Applied"
