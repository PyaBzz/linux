#!/bin/bash
source ../bashSource/functions.sh

function undoBazBash() {
    if (fileExists $backupFilePath); then
        mv $backupFilePath $bashrcFilePath
        rm $modDirPath/*.sh
        rm $modAliasesFilePath
        echo "bashMod removed!"
    else
        echo "Original .bashrc file not found!"
        echo "Aborted"
    fi
}

function applyBazBash() {
    if (fileExists $backupFilePath); then
        # This machine has already been modded
        # Just update the dynamic part
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

        #===================  Make backup  ===================
        cp $bashrcFilePath $backupFilePath
        echo "Backup saved in $backupFilePath"

        #===================  Append to bashrc  ===================
        echo "" >>$bashrcFilePath # Todo: Replace with multi line echo
        echo "" >>$bashrcFilePath
        echo "#===================  BazMod  ===================" >>$bashrcFilePath
        echo "" >>$bashrcFilePath
        echo "source $appendageFilePath" >>$bashrcFilePath
        echo "" >>$bashrcFilePath
    fi

    #===================  Appendage File  ===================
    cp ./appendage.sh $modDirPath
    cp ../bashSource/functions.sh $modDirPath

    #===================  Aliases  ===================
    cp aliases.sh $modAliasesFilePath
    echo "Bashrc Mod Applied!"
}

bashrcFilePath=~/.bashrc
modDirPath=~/.bashMod
backupFilePath=~/.bashMod/.bashrc.bazbak
appendageFilePath=~/.bashMod/appendage.sh
aliasesDirPath=~/.bashMod/aliases
modAliasesFilePath=~/.bashMod/aliases/modAliases.sh
# backupFilePath=./bashrc.bak
if [[ $1 == "restore" ]]; then
    if (askUser "Undo modification to .bashrc?"); then
        undoBazBash
    else
        echo "Aborted"
    fi
else
    if (askUser "Mod bashrc?"); then
        applyBazBash
    else
        echo "Aborted"
    fi
fi
