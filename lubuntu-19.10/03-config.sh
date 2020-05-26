#=================  Config  =================

step="Git config"
if (askUser "Apply $step?"); then
    git config --global user.name pyabzz
    git config --global user.email ""
else
    echo "Skipped $step ..."
fi

step="SDDM customisation"
if (askUser "Apply $step?"); then
    cp theme.conf /usr/share/sddm/themes/lubuntu
    cp source/diamondPlate.jpg /usr/share/sddm/themes/lubuntu
else
    echo "Skipped $step ..."
fi

