source ../../imports.sh

clear

# Arrange
scratchDir=./scratchDir
sourceFile="$scratchDir/sourceFile"
targetFile="$scratchDir/targetFile"

mkdir -p $scratchDir

text="b"

echo "a" >$targetFile
echo "c" >>$targetFile
echo "d" >>$targetFile
markerText="a"

# Act
addTextInFileAfterMarker $text $targetFile $markerText

# Verify
targetLine=$(sed '2q;d' $targetFile)

if [ $targetLine == $text ]; then
    echo -e "${testPassed} inserting into $targetFile"
else
    echo -e "${testFailed} inserting into $targetFile"
fi

# Clean up
rm -rf $scratchDir
