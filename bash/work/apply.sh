source ./work.sh

askToProceed "Apply $pkg?"
copyFile $payloadFile to $targetFile
echo "Applied"
