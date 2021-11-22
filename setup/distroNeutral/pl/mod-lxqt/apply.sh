source ./defs.sh

askToProceed "Apply LXQT Mod?"

mkdir -p $targetDir
backupAndReplaceFilesToDir sources to $targetDir

echo "Done"
