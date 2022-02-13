source ../source4test.sh

# Definitions
targetDir="$scratchDir/targetDir"
targetFile="$targetDir/targetFile"

backupDir=$targetDir.bazbak
backupFile=$backupDir/targetFile

initialContent="initialContent"
overWriteContent="overWriteContent"

#===============  Arrange  ===============
objective="create backup dir"
mkScratchDir
mkdir -p $targetDir
echo $initialContent >$targetFile

# Act
backUp $targetDir
echo $overWriteContent >$targetFile

# Verify
if (fileExists $backupFile); then
    printTestSuccess "$objective"
else
    printTestFail "$objective"
fi

# Verify
backupContent=$(cat $backupFile)
objective="match original dir content"

if [ $backupContent == $initialContent ]; then
    printTestSuccess "$objective"
else
    printTestFail "$objective"
fi

rmScratchDir
