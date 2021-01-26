source ../../imports.sh

scriptName=$0

declare -A filesToCheck
filesToCheck["./non.existent.source1"]="targetPath1"
filesToCheck["./non.existent.source2"]="targetPath2"
filesToCheck[$scriptName]="targetPath3"

if (anyFilesMissing filesToCheck); then
    echo "Some missing"
else
    echo "All found"
fi
