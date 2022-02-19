source ../../source.sh

package="Google Chrome"

askToProceed "Install $package?"
mkdir -p $downloadsDir

if (isUbuntu); then
    dlUrl=https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
    dlFile=$HOME/Downloads/GoogleChrome.deb
    wget -O $dlFile $dlUrl
    pkgMgrInstall $dlFile
    rm -rf $dlFile
elif (isArch); then
    repoLocal=$downloadsDir/chrome
    mkdir -p $repoLocal
    repoUrl=https://aur.archlinux.org/google-chrome.git
    git clone $repoUrl $repoLocal
    cd $repoLocal
    makepkg -sri # automatically runs `pacman -U ...`
    rm -rf $repoLocal
fi

echo "Setting chrome as your default browser is done as part of your LXQT mod for file:"
echo "$HOME/.config/lxqt/session.conf"
echo "Under [Environment] section"
