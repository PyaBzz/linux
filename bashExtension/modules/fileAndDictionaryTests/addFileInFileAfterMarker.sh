source ../../imports.sh

clear

# Arrange
scratchDir=./scratchDir
sourceFile="$scratchDir/sourceFile"
targetFile="$scratchDir/targetFile"

mkdir -p $scratchDir

text="dasoo"
echo $text >$sourceFile

echo "a" >$targetFile
echo "c" >>$targetFile
echo "d" >>$targetFile
markerText="a"

# Act
addFileInFileAfterMarker $sourceFile $targetFile $markerText

# Verify
targetLine=$(sed '2q;d' $targetFile)

if [ $targetLine == $text ]; then
    echo -e "${testPassed} inserting into $targetFile"
else
    echo -e "${testFailed} inserting into $targetFile"
fi

# Clean up
rm -rf $scratchDir
