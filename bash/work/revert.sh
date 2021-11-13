source ./work.sh

askToProceed "Undo $pkg?"
rm $targetFile
echo "Removed"
