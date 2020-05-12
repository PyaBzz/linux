
function askUser {
    # synopsis: askUser <VariableToStoreResultingBoolean> [<QuestionString>]
    local res=$1
    if [ -z "$2" ]
    then
        local confirm
        read -p "Proceed? (Y/N): " confirm
    else
        read -p "$2 (Y/N): " confirm
    fi
    
    if [[ $confirm == [yY] || $confirm == [yY][eE][sS] ]]
    then
        eval $res=true
    else
        eval $res=false
    fi
}
