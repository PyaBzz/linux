source ../../imports.sh

clear

# Arrange
scratchDir=./scratchDir
sourceFile="$scratchDir/sourceFile"
targetFile="$scratchDir/targetFile"

mkdir -p $scratchDir

echo "b" >$sourceFile

echo "a" >$targetFile
echo "c" >>$targetFile
echo "d" >>$targetFile
markerText="a"

# Act
insertFileInFileAfterMarker $sourceFile $targetFile $markerText

# Verify
targetLine=$(sed '2q;d' $targetFile)

if [ $targetLine == "b" ]; then
    echo -e "${testPassed} inserting into $targetFile"
else
    echo -e "${testFailed} inserting into $targetFile"
fi

# Clean up
rm -rf $scratchDir
