copy() { #Todo: Test although covered in copyMulti
    # synopsis: copy <SourceFilePath> to <TargetFilePath>
    local sourceFile=$1
    local secondParameter=$2
    local targetFile=$3

    if (fileMissing $sourceFile); then
        echo "Func ${FUNCNAME[0]}: Source file not found at $sourceFile"
        return
    fi

    if [[ $secondParameter != "to" ]]; then
        echo "Func ${FUNCNAME[0]}: The 2nd parameter must be the word 'to'"
        return
    fi

    cp $sourceFile $targetFile 1>/dev/null 2>&1

    if (ifThatFailed); then
        #echo "Func ${FUNCNAME[0]}: Trying sudo ..."
        sudo cp $sourceFile $targetFile
    fi
}
