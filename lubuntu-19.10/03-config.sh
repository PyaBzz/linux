#=================  Config  =================

step="SDDM customisation"
if (askUser "Apply $step?"); then
    sudo cp source/SDDM/theme.conf /usr/share/sddm/themes/lubuntu
    sudo cp source/SDDM/diamondPlate.jpg /usr/share/sddm/themes/lubuntu
    cp source/SDDM/.face.icon ~
else
    echo "Skipped $step ..."
fi

