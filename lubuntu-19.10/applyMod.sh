#!/bin/bash
source ../bashSource/functions.sh

function applyBazMod {
    clear
    printLine 60 "#"
    if (askUser "Uninstall unnecessary packages?") then
        source ./00-uninstall.sh
    else
        echo "Skipped uninstall ..."
    fi
    
    clear
    printLine 60 "#"
    if (askUser "Install necessary packages?") then
        source ./01-install.sh
    else
        echo "Skipped install ..."
    fi
    
    clear
    printLine 60 "#"
    if (askUser "Clean-up seemingly unused packages?") then
        source ./02-cleanup.sh
    else
        echo "Skipped clean-up ..."
    fi
    
    clear
    printLine 60 "#"
    if (askUser "Apply your global configs?") then
        source ./03-config.sh
    else
        echo "Skipped config ..."
    fi
    
    clear
    printLine 60 "#"
    source ./04-finish.sh
}

applyBazMod
