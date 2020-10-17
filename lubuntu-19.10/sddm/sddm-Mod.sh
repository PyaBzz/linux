source ../../bashMod/functions.sh

function applySddmMod() {
    sudo cp ./theme.conf /usr/share/sddm/themes/lubuntu
    sudo cp ./diamondPlate.jpg /usr/share/sddm/themes/lubuntu
    cp ./.face.icon ~
}

clear
printLine 60 "#"
step="SDDM customisation"

if (askUser "Apply $step?"); then
    applySddmMod
else
    echo "Skipped $step"
fi
