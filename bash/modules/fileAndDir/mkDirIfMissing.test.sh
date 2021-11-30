source ../source4test.sh

# Definitions

parentDir=$scratchDir/parent
childDir=$parentDir/child

# Arrange
# rmScratchDir
objective="making dir normally if missing"
mkScratchDir
wipeScratchDir
mkdir -p $parentDir

# Act
mkDirIfMissing $childDir

# Verify
if (dirExists $childDir); then
    printTestSuccess "$objective"
else
    printTestFail "$objective"
fi

rmScratchDir

# Arrange
objective="making dir as su if missing"
mkScratchDir
wipeScratchDir
mkdir -p $parentDir
chmod -w $parentDir

# Act
mkDirIfMissing $childDir

# Verify
if (dirExists $childDir); then
    printTestSuccess "$objective"
else
    printTestFail "$objective"
fi

rmScratchDir
