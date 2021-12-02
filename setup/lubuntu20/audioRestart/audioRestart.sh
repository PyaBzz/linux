source ../../source.sh

shortcutFile=./audioRestart.desktop
desktop="$HOME/Desktop"

packageName="audio-restart"

if (askUserClear "Install $packageName?"); then
    copy $shortcutFile to $desktop
    echo "$packageName Applied!"
else
    echo "Aborted"
fi
