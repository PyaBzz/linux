getCallingScriptDir() {
    # Gets the absolute path to the calling script that started this all
    # It's OK to source from here
    dirname "$(readlink -f "$0")"
}


fileExists() {
    # synopsis: fileExists <PathToFile>
    # No quotes around the path!
    if [ -f "$1" ]; then
        true
    else
        false
    fi
}

fileMissing() {
    # synopsis: fileMissing <PathToFile>
    # No quotes around the path!
    if [ ! -f "$1" ]; then
        true
    else
        false
    fi
}

dirExists() {
    # synopsis: dirExists <PathToDir>
    # No quotes around the path!
    if [ -d "$1" ]; then
        true
    else
        false
    fi
}

dirMissing() {
    # synopsis: dirMissing <PathToDir>
    # No quotes around the path!
    if [ ! -d "$1" ]; then
        true
    else
        false
    fi
}

insertContentInFileAfterMarker() {
    # synopsis: insertContentInFile <sourceFile> <destinationFile> <markerText>
    sed -i "/$markerText/r $sourceFile" $destinationFile
}

overwriteFile() {
    # synopsis: overwriteFile <SourceFilePath> to <TargetFilePath>
    local sourceFile=$1
    local secondParameter=$2
    local targetFile=$3

    if (fileMissing $targetFile); then
        echo "${FUNCNAME[0]} function: Target file not found at $targetFile"
        return
    fi

    copyOrReplaceFile $sourceFile to $targetFile
}

copyOrReplaceFile() {
    # synopsis: copyOrReplaceFile <SourceFilePath> to <TargetFilePath>
    local sourceFile=$1
    local secondParameter=$2
    local targetFile=$3

    if (fileMissing $sourceFile); then
        echo "${FUNCNAME[0]} function: Source file not found at $sourceFile"
        return
    fi

    if [[ $secondParameter != "to" ]]; then
        echo "${FUNCNAME[0]} function: The 2nd parameter must be the word 'to'"
        return
    fi

    cp $sourceFile $targetFile

    if [ "$?" -ne "0" ]; then
        echo "Trying operation as root ..."
        sudo cp $sourceFile $targetFile
    fi
}

makeBackupOf() {
    # synopsis: makeBackupOf <PathToTargetFile>
    # Puts a backup of the file next to it
    local targetFile=$1
    local backupFile=$targetFile.bazbak

    if (fileMissing $targetFile); then
        echo "${FUNCNAME[0]} function: Target file not found at $targetFile"
        return
    fi

    if (fileExists $backupFile); then
        echo "function ${FUNCNAME[0]}: Skipped backup file as it exists at $backupFile"
        return 2  # 2 means that backup already exists
    fi

    cp $targetFile $backupFile

    if [[ $? != 0 ]]; then # Check result of the last command
        echo "Trying operation as root ..."
        sudo cp $targetFile $backupFile
    fi

    if (fileExists $backupFile); then
        echo "function ${FUNCNAME[0]}: Backup saved in $backupFile"
    fi
}

restoreFile() {
    # synopsis: restoreFile <PathToTargetFile>
    # Restores the original file and removes backup
    local targetFile=$1
    local backupFile=$targetFile.bazbak

    if (fileMissing $backupFile); then
        echo "function ${FUNCNAME[0]}: Backup file not found at $backupFile"
        return
    fi

    mv $backupFile $targetFile

    if [[ $? != 0 ]]; then # Check result of the last command
        echo "Trying operation as root ..."
        sudo mv $backupFile $targetFile
    fi

    if (fileMissing $backupFile); then
        echo "function ${FUNCNAME[0]}: File restored in $targetFile"
    else
        echo "function ${FUNCNAME[0]}: Could not restore $targetFile"
    fi
}
