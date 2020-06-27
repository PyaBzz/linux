#!/bin/bash
source ../bashSource/functions.sh

function undoBazBash {
    if (askUser "Undo modification to .bashrc?") then
        if (fileExists ./bashrc.bak) then
            cp ./bashrc.bak ~/.bashrc
            rm ./bashrc.bak
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
