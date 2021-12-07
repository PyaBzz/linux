source ../../source.sh

askToProceed "Install Bluetooth services?"

pkgMgrAskInstall "bluez"
pkgMgrAskInstall "bluez-utils"
pkgMgrAskInstall "blueman"

sudo systemctl enable bluetooth.service

myFile=mpris-proxy.service
targetDir=~/.config/systemd/user
mkdir -p $targetDir
targetFile=$targetDir/$myFile
copy $myFile $targetFile

# This service is for media button controls
systemctl enable mpris-proxy.service --user
systemctl start mpris-proxy.service --user
