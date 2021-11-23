source ./defs.sh

askToProceed "Take conf files from this machine?"

mkdir -p $sourcesDir
cp $targetDir/*.conf $sourcesDir

echo "Done"
