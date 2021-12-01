backupAndReplaceFilesToDir() {
    # synopsis: backupAndReplaceFilesToDir <ArrayOfSourcePaths> to <targetDirPath>
    local -n _1srcFiles=$1
    local secondParameter=$2
    local targetDir=$3

    if [[ $secondParameter != "to" ]]; then
        echo "Func ${FUNCNAME[0]}: The 2nd parameter must be the word 'to'"
        return
    fi

    targetFiles=()
    for file in ${_1srcFiles[@]}; do
        targetFiles+=($targetDir/$(basename "$file"))
    done

    backupAndReplaceFiles _1srcFiles to targetFiles
}
