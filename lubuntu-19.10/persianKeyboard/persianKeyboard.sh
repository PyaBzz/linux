source ../../bashMod/functions.sh

function apply() {
    makeBackupOf $targetFilePath

    if [[ $? == 2 ]]; then 
        if (askUser "You've already been modded. Update?"); then
            echo "Updating $packageName"
        else
            echo "Aborted"
            return
        fi
    fi

    overwriteFile $myFilePath to $targetFilePath
    # setxkbmap -model pc105 -layout gb,ir -option grp:switch,grp:alt_shift_toggle
    echo "$packageName Applied!"
}

clear
printLine 60 "#"
packageName="persian keyboard layout fix"
myFilePath=./ir
targetFilePath=/usr/share/X11/xkb/symbols/ir

if [[ $1 == "restore" ]]; then
    if (askUser "Undo $packageName?"); then
        restoreFile $targetFilePath
    else
        echo "Aborted"
    fi
else
    if (askUser "Apply $packageName?"); then
        apply
    else
        echo "Aborted"
    fi
fi
