source ../source4test.sh

# Definitions
targetFile="$scratchDir/targetFile"
backupFile=$targetFile.bazbak
initialContent="initialContent"
overWriteContent="overWriteContent"

#===============  Arrange  ===============
objective="create backup file"
mkScratchDir
echo $initialContent >$targetFile

# Act
backUp $targetFile
echo $overWriteContent >$targetFile

# Verify
if (fileExists $backupFile); then
    printTestSuccess "$objective"
else
    printTestFail "$objective"
fi

# Verify
backupContent=$(cat $backupFile)
objective="match original file content"

if [ $backupContent == $initialContent ]; then
    printTestSuccess "$objective"
else
    printTestFail "$objective"
fi

rmScratchDir
