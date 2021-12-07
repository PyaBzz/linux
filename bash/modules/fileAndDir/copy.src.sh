copy() { #Todo: Test although covered in copyMulti
    # synopsis: copy <SourceFilePath> <TargetFilePath>
    local sourceFile=$1
    local targetFile=$2

    if (fileMissing $sourceFile); then
        echo "Func ${FUNCNAME[0]}: Source file not found at $sourceFile"
        return
    fi

    cp $sourceFile $targetFile 1>/dev/null 2>&1

    if (ifThatFailed); then
        #echo "Func ${FUNCNAME[0]}: Trying sudo ..."
        sudo cp $sourceFile $targetFile
    fi
}
