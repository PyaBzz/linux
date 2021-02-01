source ../bashExtension/imports.sh

packageName="Google Chrome"

if (askUserClear "Install $packageName?"); then
    wget -O $HOME/Downloads/GoogleChrome.deb https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
    sudo apt install $HOME/Downloads/GoogleChrome.deb
    rm -rf $HOME/Downloads/GoogleChrome.deb

    # Set Chrome as your default browser
    addTextInFileAfterMarker "BROWSER=/usr/bin/google-chrome" $HOME/.config/lxqt/session.conf "\[Environment\]"
else
    echo "Skipped $packageName ..."
fi
