source ../../imports.sh

clear
thisDir=$(pwd)

if (dirExists $thisDir); then
    echo -e "${testPassed} finding $thisDir"
else
    echo -e "${testFailed} finding $thisDir"
fi

noSuchDir="noSuchDir"

if (dirExists $noSuchDir); then
    echo -e "${testFailed} not finding $noSuchDir"
else
    echo -e "${testPassed} not finding $noSuchDir"
fi
