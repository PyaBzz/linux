source ../../bashMod/functions.sh

packageName="Docker aliases"
payloadFile=./alias
targetFile=~/.bashMod/aliases/docker.sh

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
    copyOrReplaceFile $payloadFile to $targetFile
    echo "Applied"
else
    echo "Aborted"
fi
