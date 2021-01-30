source ../../imports.sh

clear
thisDir=$(pwd)

if (dirMissing $thisDir); then
    echo -e "${testFailed} finding $thisDir"
else
    echo -e "${testPassed} finding $thisDir"
fi

noSuchDir="noSuchDir"

if (dirMissing $noSuchDir); then
    echo -e "${testPassed} not finding $noSuchDir"
else
    echo -e "${testFailed} not finding $noSuchDir"
fi
