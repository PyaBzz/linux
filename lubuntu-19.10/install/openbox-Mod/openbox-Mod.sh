source ../../../bashSource/functions.sh

function applyOpenboxMod() {
    if (fileExists ./lxqt-rc.bak); then
        echo "Backup file exists!"
        if (askUser "Overwrite it?"); then
            echo "Overwriting backup file ..."
        else
            echo "Skipped $packageName"
            return
        fi
    fi
    echo "Applying $packageName"
    cp ~/.config/openbox/lxqt-rc.xml ./lxqt-rc.bak
    echo "Backup saved in ./lxqt-rc.bak"
    cp ./lxqt-rc.xml ~/.config/openbox/lxqt-rc.xml
    openbox --reconfigure
    echo "$packageName Applied!"
}

clear
printLine 60 "#"
packageName="Openbox Mod"
if (askUser "Apply $packageName?"); then
    applyOpenboxMod
else
    echo "Skipped $packageName"
fi
