source ../../imports.sh

declare -A filesToCheck
filesToCheck["target path 1"]="./non.existent.source1"
filesToCheck["target path 2"]="./non.existent.source2"
filesToCheck["target path 3"]="./anyFilesMissing.sh"

if (anyFilesMissing ${filesToCheck[@]}); then
    echo "Some missing"
else
    echo "All found"
fi
