
#=================  Uninstall  =================
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
vlc*
do
    clear
    printLine 60 "#"
    echo "Purging $packageName"
    sudo apt-get purge $packageName
done
printLine 60 "#"


#=================  Cleanup  =================

sudo apt autoremove
printLine 60 "#"

#=================  Install  =================

sudo apt-get update

for packageName in \
git
do
    clear
    printLine 60 "#"
    echo "Installing $packageName"
    sudo apt-get install $packageName
done
printLine 60 "#"

#=================  Config  =================

git config --global user.name pyabzz
git config --global user.email ""
printLine 60 "#"
