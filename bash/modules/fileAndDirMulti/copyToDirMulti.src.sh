copyToDirMulti() {
    # synopsis: copyToDirMulti <ArrayOfSourcePaths> to <targetDirPath>
    local -n _1srcFiles=$1
    local secondParameter=$2
    local targetDir=$3

    if [[ $secondParameter != "to" ]]; then
        echo "Func ${FUNCNAME[0]}: The 2nd parameter must be the word 'to'"
        return
    fi

    for file in ${_1srcFiles[@]}; do
        copy $file to $targetDir
    done
}
