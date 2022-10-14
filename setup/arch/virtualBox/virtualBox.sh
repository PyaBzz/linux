source ../source.sh

package="virtualbox"
askToProceed "Install $package?"

pkgMgrAskInstall virtualbox
sudo gpasswd -a $USER vboxusers
sudo modprobe vboxdrv
# pkgMgrAskInstall virtualbox-guest-iso
