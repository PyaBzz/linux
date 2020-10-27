source ../../bashMod/functions.sh

clear
printLine 60 "#"
packageName="Docker aliases"
payloadFile=./alias
targetFile=~/.bashMod/aliases/docker.sh

if [[ $1 == "restore" ]]; then
    if (askUser "Undo $packageName?"); then
        rm $targetFile
        echo "Removed"
        return
    else
        echo "Aborted"
        return
    fi
fi

if (askUser "Apply $packageName?"); then
    copyOrReplaceFile $payloadFile to $targetFile
    echo "Applied"
else
    echo "Aborted"
fi
