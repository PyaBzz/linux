#!/bin/bash
source ../bashSource/functions.sh

function applyBazMod {
    if (askUser "Mod packages?") then
        source ./initialise.sh
        echo "All done!"
    else
        echo "Quitting ..."
    fi
}

applyBazMod
