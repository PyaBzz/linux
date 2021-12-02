source ../../source.sh

apply() {
    backUp $targetFile

    if (backUpSkipped); then
        if (askUser "You've already been modded. Update?"); then
            echo "Updating $packageName"
        else
            echo "Aborted"
            return
        fi
    fi

    copy $myFile to $targetFile
    openbox --reconfigure

    echo "numlock=true" >>$sessionConfigFile

    mkdir -p $autostartDir
    copy $shortcutFile to $autostartDir
    copy $shortcutFile to $desktop

    echo "$packageName Applied!"
}

packageName="Openbox Mod"

myFile=./lxqt-rc-baz.xml
targetFile="$HOME/.config/openbox/lxqt-rc.xml"

shortcutFile=./xmodmap.desktop
autostartDir="$HOME/.config/autostart"
desktop="$HOME/Desktop"

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
