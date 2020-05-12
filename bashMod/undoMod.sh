#!/bin/bash
source ../bashSource/functions.sh

function undoBazBash {
    local shouldUndoBazBash
    askUser shouldUndoBazBash "Undo modification to .bashrc?"
    if [ $shouldUndoBazBash == true ]
    then
        if [ -f ./bashrcBak ];
        then
            cp ./bashrcBak ~/.bashrc
            rm ~/.bashrcBaz
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
