source ../../imports.sh

clear

# Arrange
scratchDir=./scratchDir
mkdir -p $scratchDir

sourceFile="$scratchDir/sourceFile"
overWriteContent="overWriteContent"
echo $overWriteContent >$sourceFile

targetFile="$scratchDir/targetFile"
initialContent="initialContent"
echo $initialContent >$targetFile

# Act
overwriteFile $sourceFile to $targetFile

# Verify
finalContent=$(cat $targetFile)

if [ $finalContent == $overWriteContent ]; then
    result=${testPassed}
else
    result=${testFailed}
fi
echo -e "${result} overwriting $sourceFile into $targetFile"

# Clean up
rm -rf $scratchDir
