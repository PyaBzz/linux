# todo: break the file down
allFilesExist() {
    # synopsis: allFilesExist <arrayOfPaths>
    local -n files=$1
    local res=true
    for file in "${files[@]}"; do
        if (fileMissing $file); then
            res=false
        fi
    done
    $res
}

anyFileMissing() {
    # synopsis: anyFileMissing <arrayOfPaths>
    local -n files=$1
    local res=false

    for file in ${files[@]}; do
        if (fileMissing $file); then
            res=true
        else
            :
        fi
    done
    $res
}

copyFiles() {
    # synopsis: copyFile <ArrayOfSourcePaths> to <ArrayOfTargetPaths>
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

    if (anyFileMissing sources); then
        echo "${FUNCNAME[0]} some of the source files are missing"
        return
    fi

    for index in "${!sources[@]}"; do
        copyFile ${sources[$index]} to ${targets[$index]}
    done
}

backupFiles() {
    # synopsis: backupFiles <ArrayOfTargetPaths>
    local -n targets=$1
    local targetsCount=${#targets[@]}
    local verbosity=$2

    if (anyFileMissing targets); then
        echo "${FUNCNAME[0]} some of the target files are missing"
        return
    fi

    for index in "${!targets[@]}"; do
        backUp ${targets[$index]} $verbosity
    done
}

backupAndReplaceFiles() {
    # synopsis: backupAndReplaceFiles <ArrayOfSourcePaths> to <ArrayOfTargetPaths>
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

    if (anyFileMissing _0sources); then
        echo "${FUNCNAME[0]} some of the source files are missing"
        return
    fi

    for index in "${!_0sources[@]}"; do
        backupAndReplaceFile ${_0sources[$index]} to ${targets[$index]}
    done
}

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
