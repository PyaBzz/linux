source ./defs.sh

askToProceed "Take conf file from this machine?"

copyFile $targetFile to $sourceFile

echo "Done"
