source ../../source.sh

package="SDDM customisation"

if (askUserClear "Apply $package?"); then
    :
else
    echo "Aborted"
    exit 1
fi

# confDir=/etc/sddm.conf.d
# mkDirIfMissing $confDir

sourceFiles=(
    "./baz.icon"
)
# "./theme.conf"
# "./bazWallpaper.jpg"

targetFiles=(
    "$HOME/.face.icon"
)
# "$confDir/theme.conf"
# "/usr/share/sddm/themes/lubuntu/bazWallpaper"

copyMulti sourceFiles targetFiles
setfacl -m u:sddm:x $HOME

echo "Applied $package"
