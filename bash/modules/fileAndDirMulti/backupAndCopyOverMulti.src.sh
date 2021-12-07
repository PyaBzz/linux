copyWithBackupMulti() {
    # synopsis: copyWithBackupMulti <ArrayOfSourcePaths> to <ArrayOfTargetPaths>
    local -n _0sources=$1
    local secondParameter=$2
    local -n targets=$3

    if [[ $secondParameter != "to" ]]; then
        echo "Func ${FUNCNAME[0]}: The 2nd parameter must be the word 'to'"
        return
    fi

    local sourcesCount=${#_0sources[@]}
    local targetsCount=${#targets[@]}

    if [[ $sourcesCount != $targetsCount ]]; then
        echo "${FUNCNAME[0]} requires the same number of sources ($sourcesCount) and targets ($targetsCount)"
        return
    fi

    if (fileMissingMulti _0sources); then
        echo "${FUNCNAME[0]} some of the source files are missing"
        return
    fi

    for index in "${!_0sources[@]}"; do
        copyWithBackup ${_0sources[$index]} to ${targets[$index]}
    done
}
