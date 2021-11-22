source ./defs.sh

askToProceed "Install and config xScreenSaver?"
pkgMgrAskInstall "xscreensaver"
copyFile $sourceFile to $targetFile

echo "Done"
