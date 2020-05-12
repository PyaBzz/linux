
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

#=================  Cleanup  =================

clear
printLine 60 "#"
printLine 60 "#"
echo "Purging unused packages"
sudo apt autoremove

#=================  Config  =================

clear
printLine 60 "#"
echo "Applying configs"

git config --global user.name pyabzz
git config --global user.email ""

#=================  Finish  =================

clear
printLine 60 "#"
echo "All done!"
