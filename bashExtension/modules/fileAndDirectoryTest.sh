source fileAndDirectory.sh

declare -A filesToCheck
filesToCheck["target path 1"]="./non.existent.source1"
filesToCheck["target path 2"]="./non.existent.source2"
filesToCheck["target path 3"]="./fileAndDirectory.sh"

if (sourcesExist ${filesToCheck[@]}); then
    echo "All found"
else
    echo "Some missing"
fi
