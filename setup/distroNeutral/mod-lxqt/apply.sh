source ../../source.sh

askToProceed "Apply LXQT Mod?"

sources=($(ls conf/*.conf))
targetDir=$HOME/.config/lxqt
mkdir -p $targetDir

backupAndReplaceFilesToDir sources to $targetDir

echo "Applied"
