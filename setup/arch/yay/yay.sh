source ../source.sh

askToProceed "Install YAY the AUR helper?"

mkdir -p $downloadsDir
repoLocal=$downloadsDir/yay
mkdir -p $repoLocal

repoUrl=https://aur.archlinux.org/yay.git

git clone $repoUrl $repoLocal
cd $repoLocal
makepkg -sri # automatically runs `pacman -U ...`
rm -rf $repoLocal

echo "Done!"
