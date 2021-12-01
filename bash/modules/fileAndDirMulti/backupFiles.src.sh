# todo: has got little use
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
