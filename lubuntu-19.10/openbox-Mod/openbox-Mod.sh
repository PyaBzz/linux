source ../../bashSource/functions.sh

function applyOpenboxMod() {
    backupFilePath=./lxqt-rc.xml.bak
    configFilePath=~/.config/openbox/lxqt-rc.xml
    if (fileExists $backupFilePath); then
        echo "Backup file found"
        echo "Restoring ..."
        cp $backupFilePath $configFilePath
        echo "Restored"
    else
        echo "Backup file not found"
        cp $configFilePath $backupFilePath
        echo "Backup saved in $backupFilePath"
    fi

    echo "Applying $packageName"
    sed -i "/<\/keyboard>/r ./lxqt-rc-baz.xml" $configFilePath
    openbox --reconfigure
    echo "$packageName Applied!"
}

clear
printLine 60 "#"
packageName="Openbox Mod"
if (askUser "Apply $packageName?"); then
    applyOpenboxMod
    echo "numlock=true" >> ~/.config/lxqt/session.conf
else
    echo "Skipped $packageName"
fi
