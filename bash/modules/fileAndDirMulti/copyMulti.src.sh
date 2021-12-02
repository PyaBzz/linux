# todo: has got little use
copyMulti() {
    # synopsis: copy <ArrayOfSourcePaths> to <ArrayOfTargetPaths>
    local -n sources=$1
    local secondParameter=$2
    local -n targets=$3

    if [[ $secondParameter != "to" ]]; then
        echo "Func ${FUNCNAME[0]}: The 2nd parameter must be the word 'to'"
        return
    fi

    local sourcesCount=${#sources[@]}
    local targetsCount=${#targets[@]}

    if [[ $sourcesCount != $targetsCount ]]; then
        echo "${FUNCNAME[0]} requires the same number of sources and targets"
        return
    fi

    if (fileMissingMulti sources); then
        echo "${FUNCNAME[0]} some of the source files are missing"
        return
    fi

    for index in "${!sources[@]}"; do
        copy ${sources[$index]} to ${targets[$index]}
    done
}
