source ./defs.sh

askToProceed "Undo $pkg?"
unlink $aliasLnk
echo "Removed"
