#=================  Uninstall  =================

local aggressivePurge=false
if (askUser "Aggressive purge?"); then
    aggressivePurge=true
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
    if $aggressivePurge; then
        echo "Purging $packageName"
        sudo apt-get purge $packageName
    else
        echo "Removing $packageName"
        sudo apt-get remove $packageName
    fi
done
