source ../../imports.sh

clear
thisFile=$0

if (fileExists $thisFile); then
    echo -e "${testPassed} finding $thisFile"
else
    echo -e "${testFailed} finding $thisFile"
fi

noSuchFile="noSuchFile"

if (fileExists $noSuchFile); then
    echo -e "${testFailed} not finding $noSuchFile"
else
    echo -e "${testPassed} not finding $noSuchFile"
fi
