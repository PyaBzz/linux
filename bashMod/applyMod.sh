#!/bin/bash
source ../bashSource/functions.sh

function getScriptDir {
    # We cannot source this from another file as the returned
    # value reflects the directory where this script exists
    echo "$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"
}

function applyBazBash {
    bashrcFilePath=~/.bashrc
    backupFilePath=~/.bashrc.bazbak
    dynamicBashrcFilePath=./bashrcSrcDynamic.sh
    if ( askUser "Mod bashrc?" ) then
        if (fileExists $backupFilePath) then
            echo "Backup file exists!"
            if (askUser "Overwrite it?") then
                echo "Overwriting backup file ..."
            else
                echo "Skipping bashMod ..."
                return
            fi
        fi

        #===================  Make backup  ===================
        cp $bashrcFilePath $backupFilePath
        echo "Backup saved in $backupFilePath"

        #===================  Bashrc  ===================
        echo "" >> $bashrcFilePath  # Todo: Replace with multi line echo
        echo "" >> $bashrcFilePath
        echo "#===================  BazMod  ===================" >> $bashrcFilePath
        echo "" >> $bashrcFilePath
        echo "source $(getScriptDir)/bashrcSrc.sh" >> $bashrcFilePath
        echo "" >> $bashrcFilePath

        #===================  Bashrc dynamic  ===================
        if (fileExists $dynamicBashrcFilePath) then
            echo "Dynamic file exists!"
            if (askUser "Overwrite it?") then
                echo "Overwriting dynamic file ..."
                echo "" > $dynamicBashrcFilePath
            else
                echo "Using existing dynamic file"
                return
            fi
        fi
        echo "#===================  Aliases  ===================" >> $dynamicBashrcFilePath
        echo "" >> $dynamicBashrcFilePath
        echo "Bashrc Mod Applied!"
    else
        echo "Skipped bashMod"
    fi
}

applyBazBash
