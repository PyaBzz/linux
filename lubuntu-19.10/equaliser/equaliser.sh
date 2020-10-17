source ../../bashMod/functions.sh

clear
printLine 60 "#"
packageName="pulseaudio-equalizer"

if (askUser "Install $packageName?"); then
    sudo apt-get update
    sudo apt-get install $packageName
    cp ./Equaliser.desktop ~/Desktop
    echo "" | sudo tee -a /etc/pulse/default.pa >/dev/null
    echo "load-module module-dbus-protocol" | sudo tee -a /etc/pulse/default.pa >/dev/null
else
    echo "Skipped $packageName"
fi
