source ../../bashExtension/imports.sh

function apply() {
    backUp $targetFilePath

    if [[ $? == 2 ]]; then
        if (askUser "You've already been modded. Update?"); then
            echo "Updating $packageName"
        else
            echo "Aborted"
            return
        fi
    fi

    copyFile $myFilePath to $targetFilePath # Todo: Verify all files exist (including targets to be overwritten) before making any change to the computer
    openbox --reconfigure
    echo "numlock=true" >>~/.config/lxqt/session.conf
    mkdir -p ~/.config/autostart
    cp $shortcutFilePath $dest1
    cp $shortcutFilePath $dest2
    echo "$packageName Applied!"
}

packageName="Openbox Mod"
myFilePath=./lxqt-rc-baz.xml #Todo: Use new plural functions to simplify script
targetFilePath=~/.config/openbox/lxqt-rc.xml
backupPath=~/.config/openbox/lxqt-rc.xml.bazbak
shortcutFilePath=./xmodmap.desktop
dest1=~/.config/autostart
dest2=~/Desktop

if [[ $1 == "restore" ]]; then
    if (askUserClear "Undo $packageName?"); then
        restoreFile $targetFilePath
    else
        echo "Aborted"
    fi
else
    if (askUserClear "Apply $packageName?"); then
        apply
    else
        echo "Aborted"
    fi
fi
