source ../../source.sh

packageName="Docker aliases"
payloadFile=./alias
targetFile=$aliasDir/docker.sh

if [[ $1 == "restore" ]]; then
    if (askUserClear "Undo $packageName?"); then
        rm $targetFile
        echo "Removed"
        return
    else
        echo "Aborted"
        return
    fi
fi

if (askUserClear "Apply $packageName?"); then
    copyFile $payloadFile to $targetFile
    echo "Applied"
else
    echo "Aborted"
fi
