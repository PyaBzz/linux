source ../source.sh

echo "First enable multilib by uncommenting BOTH of these lines:"
echo "[multilib]"
echo "Include = /etc/pacman.d/mirrorlist"
echo "in /etc/pacman.conf"

sudo pacman -Sl multilib
pkgMgrUpdateKeys
pkgMgrAskInstall wine-staging

# wine runas /trustlevel:0x20000 WhatsAppSetup.exe