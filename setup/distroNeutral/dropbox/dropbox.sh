source ../../source.sh

package="Dropbox"

shortcutPayload=./shortcut.desktop
shortcutLocal=$desktopDir/dropbox.desktop

startupPayload=./startup.desktop
startupLocal=$autostartDir/dropbox.desktop

askToProceed "Install $package?"

downloadUrl="https://www.dropbox.com/download?plat=lnx.x86_64"

mkdir -p $downloadsDir
downloadedFile=$downloadsDir/Dropbox.tar.gz
wget $downloadUrl -O $downloadedFile
tar xzf $downloadedFile -C $HOME
rm $downloadedFile

cp $shortcutPayload $shortcutLocal
mkdir -p $autostartDir
cp $startupPayload $startupLocal
