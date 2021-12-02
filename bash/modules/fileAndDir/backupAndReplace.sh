backupAndReplace() { #Todo: Test
    # synopsis: backupAndReplace <SourceFilePath> to <TargetFilePath>
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

    backUp $targetFile

    if (backUpSkipped); then
        if (askUser "Target file at $targetFile has already been modded. Replace it?"); then
            echo "Replacing $targetFile"
        else
            echo "Aborted"
            return
        fi
    fi

    copy $sourceFile to $targetFile
    echo "$targetFile copied/replaced!"
}
