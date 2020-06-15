
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

function getScriptDir {
    echo "$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"
}

function fileExists {
    # synopsis: fileExists <PathToFile>
    # No quotes needed around the path
    if [ -f "$1" ]; then
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

function printLine {
    # synopsis: printLine <LineLengthInCharacters> [<StringToRepeat>]
    local stringToRepeat="="
    
    if [ ! -z "$2" ]; then
        stringToRepeat="$2"
    fi
    
    repeatText $1 $stringToRepeat
    echo
}
