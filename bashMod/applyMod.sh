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

        #===================  Make backup  ===================
        cp ~/.bashrc ./bashrcBak
        echo "Backup saved in ./bashrcBak"

        #===================  Change bashrc  ===================
        echo "" >> ~/.bashrc
        echo "" >> ~/.bashrc
        echo "#===================  BazMod  ===================" >> ~/.bashrc
        echo "" >> ~/.bashrc
        echo "source ./projects/bazLinux/bashMod/bashrcSrc.sh" >> ~/.bashrc
        echo "source ./projects/bazLinux/bashMod/bashrcSrcDynamic.sh" >> ~/.bashrc
        echo "" >> ~/.bashrc

        #===================  Change bashrc dynamic  ===================
        echo "" > ./bashrcSrcDynamic.sh
        echo "#===================  Aliases  ===================" > ./bashrcSrcDynamic.sh
        echo "" >> ./bashrcSrcDynamic.sh
        echo "Bashrc Mod Applied!"
    else
        echo "Skipping bashMod ..."
    fi
}

applyBazBash
