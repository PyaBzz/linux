backUp() {
    # synopsis: backUp <PathToTargetFile> [-v|--verbose]
    # Puts a backup of the file next to it
    local targetFile=$1
    local backupFile=$targetFile.bazbak
    local verbose=false

    if [ "$2" = "--verbose" ] || [ "$2" = "-v" ]; then verbose=true; fi

    if (fileMissing $targetFile); then
        if ($verbose); then
            echo "Func ${FUNCNAME[0]}: Target file not found at $targetFile"
        fi
        return 1
    fi

    if (fileExists $backupFile); then
        echo "Func ${FUNCNAME[0]}: Skipped backup file as it exists at $backupFile"
        return 2 # 2 means that backup already exists
    fi

    cp $targetFile $backupFile

    if (ifThatFailed); then
        sudo cp $targetFile $backupFile
    fi

    if ($verbose && fileExists $backupFile); then
        echo "Func ${FUNCNAME[0]}: Backup saved in $backupFile"
    fi
}
