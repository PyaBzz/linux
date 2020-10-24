source ../../bashMod/functions.sh

function restore() {
    if (fileExists $backupFilePath); then
        sudo mv $backupFilePath $targetFilePath
        echo "Restored!"
    else
        echo "Original file not found!"
        echo "Aborted"
    fi
}

function apply() {
    if (fileExists $backupFilePath); then
        # You've already been modded. Just update.
        echo "Backup skipped because it exists"
        if (askUser "Overwrite the existing mod?"); then
            echo "Overwriting mod ..."
        else
            echo "Aborted"
            return
        fi
    else

        #===================  Make backup  ===================
        cp $targetFilePath $backupFilePath
        echo "Backup saved in $backupFilePath"
    fi

    #===================  Apply Mod  ===================
    echo "Applying $packageName"
    sudo cp $myFilePath $targetFilePath
    # setxkbmap -option grp:switch,grp:alt_shift_toggle gb,ir
    echo "$packageName Applied!"
}

clear
printLine 60 "#"
packageName="persian keyboard correction"
myFilePath=./ir
targetFilePath=/usr/share/X11/xkb/symbols/ir
backupFilePath=/usr/share/X11/xkb/symbols/ir.bazbak
if [[ $1 == "restore" ]]; then
    if (askUser "Undo $packageName?"); then
        restore
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
