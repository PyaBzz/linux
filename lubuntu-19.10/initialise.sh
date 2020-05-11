
#=================  Uninstall  =================

sudo pt-get purge libreoffice*
sudo apt-get purge 2048-qt
sudo apt-get purge qtpass
sudo apt-get purge qlipper
sudo apt-get purge noblenote
sudo apt-get purge kcalc
sudo apt-get purge k3b*
sudo apt-get purge trojita
sudo apt-get purge pulseaudio*
sudo apt-get purge screengrab
sudo apt-get purge skanlite
sudo apt-get purge lximage-qt
sudo apt-get purge vlc*
sudo apt-get purge transmission-*
sudo apt-get purge qpdfview*

#=================  Cleanup  =================

sudo apt autoremove

#=================  Install  =================

sudo apt-get update
sudo apt-get install git
git config --global user.name pyabzz
git config --global user.email ""

