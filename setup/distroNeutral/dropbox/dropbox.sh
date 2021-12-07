source ../../source.sh

package="Dropbox"
askToProceed "Install $package?"

downloadUrl="https://www.dropbox.com/download?plat=lnx.x86_64"
shortcut=./dropbox.desktop

mkDirIfMissing $downloadsDir
downloadedFile=$downloadsDir/Dropbox.tar.gz
wget $downloadUrl -O $downloadedFile
tar xzf $downloadedFile -C $HOME
copy $shortcut $desktopDir
rm $downloadedFile
