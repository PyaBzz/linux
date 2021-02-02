# Copy this function to any script instead of sourcing it
getMyDir() { echo "$(readlink -f "$(cd "$(dirname "${BASH_SOURCE[0]}")" >/dev/null 2>&1 && pwd)")"; }

sourceFromDir() {
    # synopsis: sourceFromDir <PathToDir>
    # Sources all .sh files in the given directory
    for f in $1/*.sh; do source $f; done
}

importsDir=$(getMyDir)
modulesDir=$importsDir/modules
sourceFromDir $modulesDir
