source ../../bashExtension/imports.sh

function restore() {
    if (fileExists $backupPath); then
        mv $backupPath $configPath
        echo "Restored!"
    else
        echo "Original config file not found!"
        echo "Aborted"
    fi
}

function applyBazBash() {
    if (fileExists $backupPath); then
        # You've already been modded. Just update.
        echo "Backup skipped because it exists"
        if (askUser "Overwrite the existing mod?"); then
            echo "Overwriting mod ..."
        else
            echo "Aborted"
            return
        fi
    else

        #══════════════════  Make backup  ══════════════════
        cp $configPath $backupPath
        echo "Backup saved in $backupPath"
    fi

    #══════════════════  Apply Mod  ══════════════════
    echo "Applying $packageName"
    cp $modPath $configPath
    openbox --reconfigure
    echo "numlock=true" >>~/.config/lxqt/session.conf
    cp ./xmodmap.desktop ~/.config/autostart
    cp ./xmodmap.desktop ~/Desktop
    echo "$packageName Applied!"
}

packageName="Openbox Mod"
modPath=./lxqt-rc-baz.xml
configPath=~/.config/openbox/lxqt-rc.xml
backupPath=~/.config/openbox/lxqt-rc.xml.bazbak

if [[ $1 == "restore" ]]; then
    if (askUserClear "Undo $packageName?"); then
        restore
    else
        echo "Aborted"
    fi
else
    if (askUserClear "Apply $packageName?"); then
        applyBazBash
    else
        echo "Aborted"
    fi
fi
