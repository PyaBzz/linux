source ./defs.sh

askToProceed "Apply $pkg?"
copy $payloadFile $targetFile
echo "Applied"
