source ../../imports.sh

clear
scriptFile=$0

if (fileMissing $scriptFile); then
    echo -e "${testFailed} finding $scriptFile"
else
    echo -e "${testPassed} finding $scriptFile"
fi

nonExistentFile="nonExistentFile"

if (fileMissing $nonExistentFile); then
    echo -e "${testPassed} not finding $nonExistentFile"
else
    echo -e "${testFailed} not finding $nonExistentFile"
fi
