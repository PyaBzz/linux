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

copyFile() { #Todo: Test
    # synopsis: copyFile <SourceFilePath> to <TargetFilePath>
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

backUp() {
    # synopsis: backUp <PathToTargetFile>
    # Puts a backup of the file next to it
    local targetFile=$1
    local backupFile=$targetFile.bazbak

    if (fileMissing $targetFile); then
        echo "${FUNCNAME[0]} function: Target file not found at $targetFile"
        return
    fi

    if (fileExists $backupFile); then
        echo "function ${FUNCNAME[0]}: Skipped backup file as it exists at $backupFile"
        return 2 # 2 means that backup already exists
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

# filesExist() { #Todo: Complete rewrite and test
#     # synopsis: filesExist ${array[@]}
#     # Where array is an array or associative array of paths
#     local dict=($@)
#     local res=true
#     for file in "${dict[@]}"; do
#         if (fileMissing $file); then
#             echo "Missing file: $file"
#             res=false
#         fi
#     done
#     $res
# }

# anyFilesMissing() { #Todo: Complete rewrite and test
#     # synopsis: anyFilesMissing ${array[@]}
#     # Where array is an array or associative array of paths
#     local res=false
#     _Array.getByRef
#     for key in ${!_Array[@]}; do
#         local file=$key
#         local path=${_Array[$key]}
#         if (fileMissing $file); then
#             # echo "Missing: $file"
#             res=true
#         else
#             # echo "Found: $file"
#             :
#         fi
#     done
#     $res
# }

# copyFiles() { #Todo: Complete rewrite and test
#     # synopsis: copyOrReplaceAll ${array[@]}
#     # Where array is an associative array of paths
#     local dict=($@)

#     if (anyFilesMissing ${dict[@]}); then
#         return
#     fi

#     for destination in "${!dict[@]}"; do
#         local source=$dict[$destination]
#         copyFile $source to @destination
#     done
# }
