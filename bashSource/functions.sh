
function getScriptDir() {
    # We cannot source this from another file as the returned
    # value reflects the directory where this script exists
    # so copy this function to the target script file and run
    echo "$(cd "$(dirname "${BASH_SOURCE[0]}")" >/dev/null 2>&1 && pwd)"
}

function askUser {
    # synopsis: askUser [<QuestionString>]
    if [ -z "$1" ]; then
        local confirm
        read -p "Proceed? (Y/N): " confirm
    else
        read -p "$1 (Y/N): " confirm
    fi
    
    if [[ $confirm == [yY] || $confirm == [yY][eE][sS] ]]; then
        true
    else
        false
    fi
}

function fileExists {
    # synopsis: fileExists <PathToFile>
    # No quotes around the path!
    if [ -f "$1" ]; then
        true
    else
        false
    fi
}

function fileMissing {
    # synopsis: fileMissing <PathToFile>
    # No quotes around the path!
    if [ ! -f "$1" ]; then
        true
    else
        false
    fi
}

function dirExists {
    # synopsis: dirExists <PathToDir>
    # No quotes around the path!
    if [ -d "$1" ]; then
        true
    else
        false
    fi
}

function dirMissing {
    # synopsis: dirMissing <PathToDir>
    # No quotes around the path!
    if [ ! -d "$1" ]; then
        true
    else
        false
    fi
}

function repeatText {
    # synopsis: repeatText <NumberOfRepetitions> [<StringToRepeat>]
    local stringToRepeat=" "
    
    if [ ! -z "$2" ]; then
        stringToRepeat="$2"
    fi
    
    for ((i=1; i<=$1; i++))
    do
        printf "$stringToRepeat"
    done
}

function echoRepeatText {
    # synopsis: echoRepeatText <NumberOfRepetitions> [<StringToRepeat>]
    local stringToRepeat=" "
    
    if [ ! -z "$2" ]; then
        stringToRepeat="$2"
    fi
    local output=""
    for ((i=1; i<=$1; i++))
    do
        output+="$stringToRepeat"
    done
    echo "$output"
}

function printLine {
    # synopsis: printLine <LineLengthInCharacters> [<StringToRepeat>]
    local stringToRepeat="="
    
    if [ ! -z "$2" ]; then
        stringToRepeat="$2"
    fi
    
    echoRepeatText $1 $stringToRepeat
}
