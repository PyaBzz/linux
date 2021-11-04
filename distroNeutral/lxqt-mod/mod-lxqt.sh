source ../../source.sh

packageName="LXQT Mod"
if (askUserClear "Apply $packageName?"); then
    sourceFiles=(
        "globalkeyshortcuts.conf"
        "lxqt-config-file-associations.conf"
        "lxqt-config-locale.conf"
        "lxqt-config.conf"
        "lxqt-powermanagement.conf"
        "lxqt-runner.conf"
        "lxqt.conf"
        "notifications.conf"
        "panel.conf"
        "power.conf"
        "session.conf"
        "windowmanagers.conf"
    )

    targetDir=$HOME/.config/lxqt
    mkdir -p $targetDir

    targetFiles=(
        "$targetDir/globalkeyshortcuts.conf"
        "$targetDir/lxqt-config-file-associations.conf"
        "$targetDir/lxqt-config-locale.conf"
        "$targetDir/lxqt-config.conf"
        "$targetDir/lxqt-powermanagement.conf"
        "$targetDir/lxqt-runner.conf"
        "$targetDir/lxqt.conf"
        "$targetDir/notifications.conf"
        "$targetDir/panel.conf"
        "$targetDir/power.conf"
        "$targetDir/session.conf"
        "$targetDir/windowmanagers.conf"
    )

    backupAndReplaceFiles sourceFiles to targetFiles
else
    echo "Aborted"
    exit 1
fi

echo "Applied"
