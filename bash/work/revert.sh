source ./defs.sh

askToProceed "Undo $pkg?"
rm $targetFile
echo "Removed"
