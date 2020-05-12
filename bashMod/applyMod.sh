#!/bin/bash
source ../bashSource/functions.sh

function applyBazBash {
    local shouldChangeBashrc
    askUser shouldChangeBashrc "Mod bashrc?"
    if [ $shouldChangeBashrc == true ]
    then
        if [ -f ./bashrcBak ];
        then
            echo "Backup file exists!"
            local shouldOverWrite
            askUser shouldOverWrite "Overwrite it?"
            if [ $shouldOverWrite == true ]; then
                echo "Overwriting backup file ..."
            else
                echo "Skipping bashMod ..."
                return
            fi
        fi
        cp ~/.bashrc ./bashrcBak
        echo "Backup saved in ./bashrcBak"
        cp ./bashrcSrc.sh ~/.bashrcBaz
        echo "" >> ~/.bashrc
        echo "source ./.bashrcBaz" >> ~/.bashrc
        echo "Bashrc Mod Applied!"
        
    else
        echo "Skipping bashMod ..."
    fi
}

applyBazBash
