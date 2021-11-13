#
bashrcFile=$HOME/.bashrc
bashModDir=$HOME/.bashMod
aliasDir=$bashModDir/aliases
desktopDir=$HOME/Desktop
downloadsDir=$HOME/Downloads

isBashModded() {
    isBackedUp $bashrcFile
}
