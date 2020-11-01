source ../bashExtension/imports.sh

function undoBashMod() {
    if (hasBeenBackedUp $targetFilePath); then
        restoreFile $targetFilePath
        echo "bashMod removed!"
    else
        echo "Aborted. Original file not found!"
    fi
}

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
    if (askUser "Undo modification to .bashrc?"); then
        undoBashMod
    else
        echo "Aborted"
    fi
else
    if (askUser "Mod bashrc?"); then
        applyBashMod
    else
        echo "Aborted"
    fi
fi
