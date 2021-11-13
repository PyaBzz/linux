source ../../source.sh

# packageName="LXQT Mod"
if (askUserClear "Take conf files from this machine?"); then

    targetDir=$HOME/.config/lxqt
    cp $targetDir/*.conf .
else
    echo "Aborted"
    exit 1
fi

echo "Done"
