source ../../../source.sh

askToProceed "Take conf files from this machine?"

targetDir=$HOME/.config/lxqt
cp $targetDir/*.conf ./conf

echo "Done"
