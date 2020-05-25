#=================  Uninstall  =================

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
