source ../../bashSource/functions.sh

sudo apt-get update

clear
printLine 60 "#"
packageName="pulseaudio-equalizer"

if (askUser "Install $packageName?"); then
    sudo apt-get install $packageName
    cp ./Equaliser.desktop ~/Desktop
    echo "" >>/etc/pulse/default.pa
    echo "load-module module-dbus-protocol" >>/etc/pulse/default.pa
else
    echo "Skipped $packageName"
fi
