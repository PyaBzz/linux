source ../bashExtension/imports.sh

function appendToBashrc() {
    cat <<EOT >>$targetFilePath

#===================  BazMod  ===================
source $appendageFilePath

EOT
}

function applyBashMod() {
    if (hasBeenBackedUp $targetFilePath); then
        # You've already been modded. Just update
        echo "Backup skipped because it exists"
        if (askUser "Overwrite the existing mod?"); then
            echo "Overwriting mod ..."
        else
            echo "Aborted"
            return
        fi
    else
        #===================  Make Directory  ===================
        if (dirMissing $aliasesDirPath); then
            mkdir -p $aliasesDirPath
        fi

        makeBackupOf $targetFilePath
        appendToBashrc
    fi

    #===================  Appendage File  ===================
    cp ./appendage.sh $modDirPath

    #===================  Aliases  ===================
    cp ./alias $aliasesDirPath/mod.sh
    echo "Applied!"
}

targetFilePath=~/.bashrc
modDirPath=~/.bashMod
appendageFilePath=$modDirPath/appendage.sh
aliasesDirPath=$modDirPath/aliases

if [[ $1 == "restore" ]]; then
    if (askUserClear "Undo mod?"); then
        restoreFile $targetFilePath
    else
        echo "Aborted"
    fi
else
    if (askUserClear "Mod bashrc?"); then
        applyBashMod
    else
        echo "Aborted"
    fi
fi
