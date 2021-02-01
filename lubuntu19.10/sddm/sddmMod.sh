source ../../bashExtension/imports.sh

package="SDDM customisation"

sourceFiles=()
sourceFiles+=("./baz.icon")
sourceFiles+=("./theme.conf")
sourceFiles+=("./bazWallpaper.jpg")

targetFiles=()
targetFiles+=("$HOME/.face.icon")
targetFiles+=("/usr/share/sddm/themes/lubuntu/theme.conf")
targetFiles+=("/usr/share/sddm/themes/lubuntu/bazWallpaper")

if (askUserClear "Apply $package?"); then
    copyFiles sourceFiles to targetFiles
    echo "Applied $package"
else
    echo "Skipped $package"
fi
