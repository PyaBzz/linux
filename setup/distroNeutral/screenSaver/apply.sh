source ./defs.sh

askToProceed "Install and config xScreenSaver?"
pkgMgrAskInstall "xscreensaver"
copy $sourceFile $targetFile

echo "Done"
