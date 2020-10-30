source ../../bashMod/functions.sh

package="SDDM customisation"

myIconFile=./baz.icon
myConfigFile=./theme.conf
myImageFile=./bazWallpaper.jpg

targetIconFile=~/.face.icon
targetConfigFile=/usr/share/sddm/themes/lubuntu/theme.conf
targetImageFile=/usr/share/sddm/themes/lubuntu/bazWallpaper

if (askUserClear "Apply $package?"); then
    copyOrReplaceFile $myConfigFile to $targetConfigFile
    copyOrReplaceFile $myImageFile to $targetImageFile
    copyOrReplaceFile $myIconFile to $targetIconFile
    echo "Applied $package"
else
    echo "Skipped $package"
fi
