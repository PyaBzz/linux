
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
    # No quotes needed around the path
    if [ -f "$1" ]
    then
        true
    else
        false
    fi
}
