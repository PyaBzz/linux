source ../../source.sh

targetFile=/etc/pulse/default.pa

packageName="Realtek Power Management"

if (askUserClear "Disable $packageName?"); then
    backUp $targetFile
    sudo sed -i "/^load-module module-suspend-on-idle$/s/^/###/" $targetFile
    systemctl restart --user pulseaudio
    echo "$packageName Applied!"
else
    echo "Aborted"
fi
