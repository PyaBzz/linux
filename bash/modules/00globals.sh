#
bashModDir=$HOME/.bashMod
aliasDir=$bashModDir/aliases
desktopDir=$HOME/Desktop
downloadsDir=$HOME/Downloads
hostName=$(cat /etc/hostname)

isBashModded() {
    if [ -z ${isAppendageRun+x} ]; then false; else true; fi
}

isBashNotModded() {
    if (isBashModded); then false; else true; fi
}
