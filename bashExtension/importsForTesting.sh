# Copy this function to any script instead of sourcing it
getMyDir() { echo "$(readlink -f "$(cd "$(dirname "${BASH_SOURCE[0]}")" >/dev/null 2>&1 && pwd)")"; }

myDir=$(getMyDir)
source "$myDir/imports.sh"

testPassed="${colourGreen}Passed${colourNc}"
testFailed="${colourRed}Failed${colourNc}"

printTestTodo() {
    echo -e "${colourPurple}Todo${colourNc}"
}

printTestName() {
    local testName=$1
    echo -e "${colourCyan}${f}${colourNc}"
}
