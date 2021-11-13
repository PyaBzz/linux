source ../../source.sh

pkgMgrAskInstall retroarch

srcFile=./retroarch.cfg
targetFile=~/.config/retroarch/retroarch.cfg

pkg="config"
if (askUser "Apply $pkg?"); then
    backupAndReplaceFile $srcFile to $targetFile
    echo "$pkg applied"
else
    echo "Skipped $pkg"
fi
