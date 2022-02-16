source ./defs.sh

askToProceed "Apply $pkg?"
ln -sf $payloadFile $targetFile
echo "Applied"
