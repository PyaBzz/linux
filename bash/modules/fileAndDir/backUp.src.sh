backUp() {
    # synopsis: backUp <PathToTargetFile>
    # Puts a backup of the file next to it
    local targetFile=$1
    local backupFile=$targetFile.bazbak

    if (fileMissing $targetFile); then
        echo "Func ${FUNCNAME[0]}: Target file not found at $targetFile"
        return
    fi

    if (fileExists $backupFile); then
        echo "Func ${FUNCNAME[0]}: Skipped backup file as it exists at $backupFile"
        return 2 # 2 means that backup already exists
    fi

    copyFile $targetFile to $backupFile

    if (fileExists $backupFile); then
        echo "Func ${FUNCNAME[0]}: Backup saved in $backupFile"
    fi
}
