askUserClear() {
    # synopsis: askUser [<QuestionString>]
    clear
    printLine 60 "#"
    askUser "$1"
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

askUserChoice() {
    # synopsis: askUserChoice
    echo $1
    local index=1
    local choiceCount=$#

    echo $choiceCount

    for param in "$@"; do
        if [[ $index != 1 ]]; then
            echo "$index: $param"
            ((index++))
        fi
    done
}
