shopt -s expand_aliases
# This gets the absolute directory where the script is running (vs getCallingScriptDir)
# Don't make it a func as it would always get directory of the func source
alias getMyDir='echo "$(readlink -f "$(cd "$(dirname "${BASH_SOURCE[0]}")" >/dev/null 2>&1 && pwd)")"'

sourceFromDir() {
    # synopsis: sourceFromDir <PathToDir> <Extension>
    # Sources all files with the given extension in the given directory recursively
    # Default extension is .sh

    local extension=".sh"
    if [ ! -z "$2" ]; then
        extension="$2"
    fi
    for f in $(find $1 -name "*$extension"); do source $f; done
}

modulesDir=$(getMyDir)/modules
sourceFromDir $modulesDir .src.sh
