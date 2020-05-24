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
        echo "" >> ~/.bashrc
        echo "source ./projects/bazLinux/bashMod/bashrcSrc.sh" >> ~/.bashrc
        echo "Bashrc Mod Applied!"
        
    else
        echo "Skipping bashMod ..."
    fi
}

applyBazBash
