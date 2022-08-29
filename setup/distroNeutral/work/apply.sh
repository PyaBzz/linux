source ./defs.sh

askToProceed "Apply $pkg?"
ln -sf $aliasSrc $aliasLnk
echo "Applied"
