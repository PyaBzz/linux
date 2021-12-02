source ../../source.sh

packageName="persian keyboard layout fix"
myLayoutFile=./ir
targetLayoutFile=/usr/share/X11/xkb/symbols/ir

apply() {
    if (isBackedUp $targetLayoutFile); then
        if (askUser "Overwrite the existing mod?"); then
            echo "Overwriting mod ..."
            restoreFile $targetLayoutFile
        else
            echo "Skipped"
            return
        fi
    fi

    backupAndReplace $myLayoutFile to $targetLayoutFile
}
