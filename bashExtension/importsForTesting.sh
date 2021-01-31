getRunningScriptDir() {
    # Copy this function to the target script file instead of sourcing it from here
    # as it gets the directory where the function definition exists
    echo "$(readlink -f "$(cd "$(dirname "${BASH_SOURCE[0]}")" >/dev/null 2>&1 && pwd)")"
}
myDir=$(getRunningScriptDir)
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
