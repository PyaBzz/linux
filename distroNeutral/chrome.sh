source ../source.sh

packageName="Google Chrome"

if (askUserClear "Install $packageName?"); then
    mkDirIfMissing $downloadsDir
    if (isUbuntu); then
        dlUrl=https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
        dlFile=$HOME/Downloads/GoogleChrome.deb
        wget -O $dlFile $dlUrl
        pkgMgrInstall $dlFile
        rm -rf $dlFile
    elif (isArch); then
        repoLocal=$downloadsDir/chrome
        mkDirIfMissing $repoLocal
        repoUrl=https://aur.archlinux.org/google-chrome.git
        git clone $repoUrl $repoLocal
        cd $repoLocal
        makepkg -sri # automatically runs `pacman -U ...`
        rm -rf $repoLocal
    fi
    # Set Chrome as your default browser
    addTextInFileAfterMarker "BROWSER=/usr/bin/google-chrome-stable" $HOME/.config/lxqt/session.conf "\[Environment\]"
else
    echo "Skipped $packageName ..."
fi
