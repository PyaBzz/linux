#!/bin/bash
source ../bashSource/functions.sh

function applyBazBash {
    if ( askUser "Mod bashrc?" ) then
        if (fileExists ./bashrcBak) then
            echo "Backup file exists!"
            if (askUser "Overwrite it?") then
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
