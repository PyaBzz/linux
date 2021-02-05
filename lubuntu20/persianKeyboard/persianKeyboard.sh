source ../../source.sh

apply() {
    if (isBackedUp $targetFile); then
        if (askUser "You've already been modded. Update?"); then
            echo "Updating $packageName"
        else
            echo "Aborted"
            return
        fi
    else
        backUp $targetFile
    fi

    copyFile $myFile to $targetFile
    setxkbmap -model pc105 -layout gb,ir -option grp:switch,grp:alt_shift_toggle #Todo: Find a way for this to persist after reboot
    echo "$packageName Applied!"
}

packageName="persian keyboard layout fix"
myFile=./ir
targetFile=/usr/share/X11/xkb/symbols/ir

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
