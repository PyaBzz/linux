getScriptDir() {
    # We cannot source this from another file as the returned
    # value reflects the directory where this script exists
    # so copy this function to the target script file and run
    echo "$(cd "$(dirname "${BASH_SOURCE[0]}")" >/dev/null 2>&1 && pwd)"
}

getMyDir() {
    dirname "$(readlink -f "$0")"
}

askUser() {
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

fileExists() {
    # synopsis: fileExists <PathToFile>
    # No quotes around the path!
    if [ -f "$1" ]; then
        true
    else
        false
    fi
}

fileMissing() {
    # synopsis: fileMissing <PathToFile>
    # No quotes around the path!
    if [ ! -f "$1" ]; then
        true
    else
        false
    fi
}

dirExists() {
    # synopsis: dirExists <PathToDir>
    # No quotes around the path!
    if [ -d "$1" ]; then
        true
    else
        false
    fi
}

dirMissing() {
    # synopsis: dirMissing <PathToDir>
    # No quotes around the path!
    if [ ! -d "$1" ]; then
        true
    else
        false
    fi
}

repeatText() {
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

echoRepeatText() {
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

printLine() {
    # synopsis: printLine <LineLengthInCharacters> [<StringToRepeat>]
    local stringToRepeat="="
    
    if [ ! -z "$2" ]; then
        stringToRepeat="$2"
    fi
    
    echoRepeatText $1 $stringToRepeat
}

printColours() {
    for x in {0..8}; do
        for i in {30..37}; do
            for a in {40..47}; do
                echo -ne "\e[$x;$i;$a""m\\\e[$x;$i;$a""m\e[0;37;40m "
            done
            echo
        done
    done
    echo ""
}

insertContentInFileAfterMarker() {
    # synopsis: insertContentInFile <sourceFile> <destinationFile> <markerText>
    sed -i "/$markerText/r $sourceFile" $destinationFile
}

replaceFile() {
    # synopsis: replaceFile <PathToTargetFile> with <PathToNewFile>
    local targetFile=$1
    local secondParameter=$2
    local replacementFile=$3

    if (fileMissing $targetFile); then
        echo "${FUNCNAME[0]} function: Target file not found at $targetFile"
        return
    fi

    if [[ $secondParameter != "with" ]]; then
        echo "${FUNCNAME[0]} function: The 2nd parameter must be the word 'with'"
        return
    fi

    if (fileMissing $replacementFile); then
        echo "${FUNCNAME[0]} function: Replacement file not found at $replacementFile"
        return
    fi

    cp $replacementFile $targetFile
}

backupFile() {
    # synopsis: backupFile <PathToTargetFile>
    # Puts a backup of the file next to it
    local targetFile=$1
    local backupFile="$1.bazbak"

    if (fileMissing $targetFile); then
        echo "${FUNCNAME[0]} function: Target file not found at $targetFile"
        return
    fi

    cp $targetFile $backupFile
}