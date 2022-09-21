source ../source.sh

echo "First enable multilib by uncommenting BOTH of these lines:"
echo "[multilib]"
echo "Include = /etc/pacman.d/mirrorlist"
echo "in /etc/pacman.conf"

pkgMgrUpdateKeys
pkgMgrAskInstall steam
