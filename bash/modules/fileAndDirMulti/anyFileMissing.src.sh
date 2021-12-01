# todo: unused func!
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
