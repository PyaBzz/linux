source ../../source.sh

pkgMgrAskInstall "bluez"
pkgMgrAskInstall "bluez-utils"
pkgMgrAskInstall "blueman"

sudo systemctl enable bluetooth.service

myFile=mpris-proxy.service
targetDir=~/.config/systemd/user
mkdir -p $targetDir
targetFile=$targetDir/$myFile

copyFile $myFile to $targetFile

systemctl enable mpris-proxy.service --user
