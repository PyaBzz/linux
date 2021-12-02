source ../source4test.sh

# Definitions
source0="$scratchDir/source0"
target0="$scratchDir/target0"

# Arrange
objective="copy normally"
mkScratchDir
touch $source0

# Act
copy $source0 to $target0

# Verify
if (fileExists $target0); then
    printTestSuccess "$objective"
else
    printTestFail "$objective"
fi

# Arrange
objective="copy as su"
mkScratchDir
touch $source0
chmod -w $scratchDir

# Act
copy $source0 to $target0

# Verify
if (fileExists $target0); then
    printTestSuccess "$objective"
else
    printTestFail "$objective"
fi

rmScratchDir
