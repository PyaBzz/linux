source ../../source.sh

package="Google Chrome"

askToProceed "Install $package?"
mkdir -p $downloadsDir
repoLocal=$downloadsDir/chrome
mkdir -p $repoLocal

repoUrl=https://aur.archlinux.org/google-chrome.git

git clone $repoUrl $repoLocal
cd $repoLocal
makepkg -sri # automatically runs `pacman -U ...`
rm -rf $repoLocal

echo "Setting chrome as your default browser is done as part of your LXQT mod for file:"
echo "$HOME/.config/lxqt/session.conf"
echo "Under [Environment] section"
