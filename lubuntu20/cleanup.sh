#!/bin/bash
source ../source.sh

cleanup() {
    if (askUserClear "Uninstall unnecessary packages?"); then
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
            if (askUserClear "$action $packageName"); then
                echo "Uninstalling $packageName"
                sudo apt-get $action -y $packageName
            else
                echo "Skipping $packageName"
            fi
        done
    else
        echo "Skipped uninstall"
    fi

    if (askUserClear "Clean-up seemingly unused packages?"); then
        echo "Cleaning-up packages"
        sudo apt autoremove
    else
        echo "Skipped clean-up"
    fi

    echo "All done!"
}

cleanup
