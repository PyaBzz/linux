#!/bin/bash
source ../bashSource/functions.sh

clear
printLine 60 "#"
if (askUser "Uninstall unnecessary packages?"); then
    local action="remove"
    if (askUser "Aggressive purge?"); then
        action="purge"
    fi

    for packageName in \
        transmission-* \
        libreoffice* \
        pulseaudio* \
        lximage-qt \
        screengrab \
        noblenote \
        qpdfview* \
        skanlite \
        2048-qt \
        qlipper \
        trojita \
        qtpass \
        kcalc \
        k3b* \
        vlc*; do
        clear
        printLine 60 "#"
        if (askUser "$action $packageName"); then
            echo "Uninstalling $packageName"
            sudo apt-get $action $packageName
        else
            echo "Skipping $packageName"
        fi
    done
else
    echo "Skipped uninstall"
fi

clear
printLine 60 "#"
if (askUser "Clean-up seemingly unused packages?"); then
    echo "Cleaning-up packages"
    sudo apt autoremove
else
    echo "Skipped clean-up"
fi

clear
printLine 60 "#"
echo "All done!"
