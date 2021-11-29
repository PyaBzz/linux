getCallingScriptDir() {
    # Gets the absolute path to the calling script that started this all
    # It's OK to source from here
    dirname "$(readlink -f "$0")"
}

fileExists() {
    # synopsis: fileExists <PathToFile>
    # No quotes around the path!
    if [ -f $1 ]; then true; else false; fi
}

fileMissing() {
    # synopsis: fileMissing <PathToFile>
    # No quotes around the path!
    if [ ! -f $1 ]; then true; else false; fi
}

dirExists() {
    # synopsis: dirExists <PathToDir>
    # No quotes around the path!
    if [ -d $1 ]; then true; else false; fi
}

dirMissing() {
    # synopsis: dirMissing <PathToDir>
    # No quotes around the path!
    if [ ! -d $1 ]; then true; else false; fi
}

mkDirIfMissing() {
    # synopsis: mkDirIfMissing <PathToDir>
    # No quotes around the path!
    mkdir -p $1

    if [ "$?" -ne "0" ]; then
        echo "Func ${FUNCNAME[0]}: Trying sudo ..."
        sudo mkdir -p $1
    fi
}

addTextInFileAfterMarker() {
    # synopsis: addTextInFileAfterMarker <text> <targetFile> <markerText>
    local text=$1
    local targetFile=$2
    local marker=$3
    sed -i "/$marker/a $text" $targetFile
}

addFileInFileAfterMarker() {
    # synopsis: addFileInFileAfterMarker <sourceFile> <targetFile> <markerText>
    local sourceFile=$1
    local targetFile=$2
    local marker=$3
    sed -i "/$marker/r $sourceFile" $targetFile
}

copyFile() { #Todo: Test although covered in copyFiles
    # synopsis: copyFile <SourceFilePath> to <TargetFilePath>
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

    cp $sourceFile $targetFile

    if [ "$?" -ne "0" ]; then
        echo "Func ${FUNCNAME[0]}: Trying sudo ..."
        sudo cp $sourceFile $targetFile
    fi
}

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

isBackedUp() {
    # synopsis: isBackedUp <PathToTargetFile>
    # Checks if target file has been backed up
    local targetFile=$1
    local backupFile=$targetFile.bazbak
    $(fileExists $backupFile)
}

restoreFile() {
    # synopsis: restoreFile <PathToTargetFile>
    # Restores the original file and removes backup
    local targetFile=$1
    local backupFile=$targetFile.bazbak

    if (fileMissing $backupFile); then
        echo "Func ${FUNCNAME[0]}: Backup file not found at $backupFile"
        return
    fi

    echo "Func ${FUNCNAME[0]}: Restoring $backupFile"
    mv $backupFile $targetFile

    if [[ $? != 0 ]]; then # Check result of the last command
        echo "Func ${FUNCNAME[0]}: Trying sudo ..."
        sudo mv $backupFile $targetFile
    fi

    if (fileMissing $backupFile); then
        echo "Func ${FUNCNAME[0]}: File restored in $targetFile"
    else
        echo "Func ${FUNCNAME[0]}: Could not restore $targetFile"
    fi
}

backupAndReplaceFile() { #Todo: Test
    # synopsis: backupAndReplaceFile <SourceFilePath> to <TargetFilePath>
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

    if [[ $? == 2 ]]; then
        if (askUser "Target file at $targetFile has already been modded. Replace it?"); then
            echo "Replacing $targetFile"
        else
            echo "Aborted"
            return
        fi
    fi

    copyFile $sourceFile to $targetFile
    echo "$targetFile copied/replaced!"
}
