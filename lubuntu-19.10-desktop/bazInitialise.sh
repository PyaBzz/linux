
#=================  Uninstall  =================

apt-get purge libreoffice*
apt-get purge 2048-qt
apt-get purge qtpass
apt-get purge qlipper
apt-get purge noblenote
apt-get purge kcalc
apt-get purge k3b*
apt-get purge trojita
apt-get purge pulseaudio*
apt-get purge screengrab
apt-get purge skanlite
apt-get purge lximage-qt
apt-get purge vlc*
apt-get purge transmission-*
apt-get purge qpdfview*

#=================  Cleanup  =================

apt autoremove

#=================  Install  =================

apt-get update
git config --global user.name pyabzz
git config --global user.email ""

