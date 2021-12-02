myDir="$(readlink -f "$(cd "$(dirname "${BASH_SOURCE[0]}")" >/dev/null 2>&1 && pwd)")"
source $myDir/../source.sh

scratchDir=./scratchDir

mkScratchDir() {
    if (dirExists $scratchDir); then
        rmScratchDir
    fi
    mkdir -p $scratchDir
}

wipeScratchDir() {
    rm -rf $scratchDir/*

    if (ifThatFailed); then
        #echo "Func ${FUNCNAME[0]}: Trying sudo ..."
        sudo rm -rf $scratchDir/*
    fi
}

rmScratchDir() {
    rm -rf $scratchDir 1>/dev/null 2>&1

    if (ifThatFailed); then
        #echo "Func ${FUNCNAME[0]}: Trying sudo ..."
        sudo rm -rf $scratchDir
    fi
}

addToScratchDir() {
    local fileName=$1
    local filePath="$scratchDir/$fileName"
    touch $filePath
    echo $filePath
}

testPassed="${colourGreen}Passed${colourNc}"
testFailed="${colourRed}Failed${colourNc}"

printTestTodo() {
    local text=$1
    echo -e "${colourPurple}Todo:${colourNc} $text"
}

printTestName() {
    local testName=$1
    echo -e "$colourCyan$testName$colourNc"
}

printTestSuccess() {
    local text=$1
    echo -e "${testPassed} $text"
}

printTestFail() {
    local text=$1
    echo -e "${testFailed} $text"
}
