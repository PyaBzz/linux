myDir="$(readlink -f "$(cd "$(dirname "${BASH_SOURCE[0]}")" >/dev/null 2>&1 && pwd)")"
source $myDir/../source.sh

scratchDir=./scratchDir
mkScratchDir() {
    mkdir -p $scratchDir
}

addToScratchDir() {
    local fileName=$1
    local filePath="$scratchDir/$fileName"
    touch $filePath
    echo $filePath
}

rmScratchDir() {
    rm -rf $scratchDir
}

testPassed="${colourGreen}Passed${colourNc}"
testFailed="${colourRed}Failed${colourNc}"

printTestTodo() {
    echo -e "${colourPurple}Todo${colourNc}"
}

printTestName() {
    local testName=$1
    echo -e "$colourCyan$f$colourNc"
}

printTestSuccess() {
    local text=$1
    echo -e "${testPassed} $text"
}

printTestFail() {
    local text=$1
    echo -e "${testFailed} $text"
}
