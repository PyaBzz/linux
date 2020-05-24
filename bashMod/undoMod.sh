#!/bin/bash
source ../bashSource/functions.sh

function undoBazBash {
    if (askUser "Undo modification to .bashrc?") then
        if (fileExists ./bashrcBak) then
            cp ./bashrcBak ~/.bashrc
            rm ./bashrcBak
            echo "Original .bashrc file restored!"
        else
            echo "Original .bashrc file not found!"
            echo "Aborting ..."
        fi
    else
        echo "Aborting ..."
    fi
}

undoBazBash
