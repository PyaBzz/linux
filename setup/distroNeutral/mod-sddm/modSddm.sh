source ../../source.sh

package="SDDM customisation"

if (askUserClear "Apply $package?"); then
    :
else
    echo "Aborted"
    exit 1
fi

# confDir=/etc/sddm.conf.d
# mkdir -p $confDir

bazIcon="$mediaDir/baz.png"
# "./theme.conf"
# "./bazWallpaper.jpg"

localIcon="$HOME/.face.icon"
# "$confDir/theme.conf"
# "/usr/share/sddm/themes/lubuntu/bazWallpaper"

ln -sf $bazIcon $localIcon
setfacl -m u:sddm:x $HOME

echo "Applied $package"
