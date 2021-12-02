source ./defs.sh

askToProceed "Apply LXQT Mod?"

mkdir -p $targetDir
backupAndReplaceMultiToDir sources to $targetDir

echo "Done"
