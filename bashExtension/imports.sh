getCallingScriptDir() {
    # Copy this function to the target script file instead of sourcing it from here
    # as it gets the directory where the function definition exists
    echo "$(readlink -f "$(cd "$(dirname "${BASH_SOURCE[0]}")" >/dev/null 2>&1 && pwd)")"
}

sourceFromDir() {
    # synopsis: sourceFromDir <PathToDir>
    # Sources all .sh files in the given directory
    for f in $1/*.sh; do source $f; done
}

myDir=$(getCallingScriptDir)
modulesDir=$myDir/modules

sourceFromDir $modulesDir
