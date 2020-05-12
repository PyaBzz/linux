#!/bin/bash
source ../bashSource/functions.sh

function applyBazMod {
    if (askUser "Mod packages?") then
        source ./initialise.sh
    else
        echo "Aborting ..."
    fi
}

applyBazMod
