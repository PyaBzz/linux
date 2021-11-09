source ../../source.sh

askToProceed "Disable Power Mgmt for the audio device?"

targetFile=/etc/pulse/default.pa
backUp $targetFile
sudo sed -i "/^load-module module-suspend-on-idle$/s/^/###/" $targetFile
systemctl restart --user pulseaudio
echo "Done!"
