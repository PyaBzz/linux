source ../../../bash/extension/imports.sh

apply() {
    backUp $targetFile

    if [[ $? == 2 ]]; then
        if (askUser "You've already been modded. Update?"); then
            echo "Updating $packageName"
        else
            echo "Aborted"
            return
        fi
    fi

    copyFile $myFile to $targetFile
    openbox --reconfigure

    echo "numlock=true" >>$sessionConfigFile

    mkdir -p $autostartDir
    copyFile $shortcutFile to $autostartDir
    copyFile $shortcutFile to $dest2

    echo "$packageName Applied!"
}

packageName="Openbox Mod"

myFile=./lxqt-rc-baz.xml
targetFile="$HOME/.config/openbox/lxqt-rc.xml"

shortcutFile=./xmodmap.desktop
autostartDir="$HOME/.config/autostart"
dest2="$HOME/Desktop"

sessionConfigFile="$HOME/.config/lxqt/session.conf"

if [[ $1 == "restore" ]]; then
    if (askUserClear "Undo $packageName?"); then
        restoreFile $targetFile
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
