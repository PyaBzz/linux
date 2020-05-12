#!/bin/bash
source ../bashSource/functions.sh

function applyBazMod {
    local shouldModifyPackages
    askUser shouldModifyPackages "Mod packages?"
    if [ $shouldModifyPackages == true ]
    then
        source ./initialise.sh
        echo "All done!"
    else
        echo "Quitting ..."
    fi
}

applyBazMod
