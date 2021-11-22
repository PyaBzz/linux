source ./defs.sh

askToProceed "Take conf files from this machine?"

cp $targetDir/*.conf ./conf

echo "Done"
