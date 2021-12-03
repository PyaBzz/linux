source ./defs.sh

askToProceed "Apply $pkg?"
copy $payloadFile to $targetFile
echo "Applied"
