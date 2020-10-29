source ../bashMod/functions.sh

packageName="Google Chrome"

if (askUserClear "Install $packageName?"); then
    wget -O ~/Downloads/GoogleChrome.deb https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
    sudo apt install ~/Downloads/GoogleChrome.deb
    rm -rf ~/Downloads/GoogleChrome.deb
    
    # Set Chrome as your default browser
    sed -i "/\[Environment\]/a BROWSER=/usr/bin/google-chrome" ~/.config/lxqt/session.conf
else
    echo "Skipped $packageName ..."
fi
