source ../../bashExtension/imports.sh

package="SDDM customisation"

myIconFile=./baz.icon
myConfigFile=./theme.conf
myImageFile=./bazWallpaper.jpg

targetIconFile=~/.face.icon
targetConfigFile=/usr/share/sddm/themes/lubuntu/theme.conf
targetImageFile=/usr/share/sddm/themes/lubuntu/bazWallpaper

if (askUserClear "Apply $package?"); then
    copyFile $myConfigFile to $targetConfigFile
    copyFile $myImageFile to $targetImageFile
    copyFile $myIconFile to $targetIconFile
    echo "Applied $package"
else
    echo "Skipped $package"
fi
