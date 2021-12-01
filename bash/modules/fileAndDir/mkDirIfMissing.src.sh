mkDirIfMissing() {
    # synopsis: mkDirIfMissing <PathToDir>
    # No quotes around the path!
    mkdir -p $1 1> /dev/null 2>&1

    if (ifThatFailed); then
        echo "Func ${FUNCNAME[0]}: Trying sudo ..."
        sudo mkdir -p $1
    fi
}
