source ../../imports.sh

clear
scriptFile=$0

if (fileExists $scriptFile); then
    echo -e "${testPassed} finding $scriptFile"
else
    echo -e "${testFailed} finding $scriptFile"
fi

nonExistentFile="nonExistentFile"

if (fileExists $nonExistentFile); then
    echo -e "${testFailed} not finding $nonExistentFile"
else
    echo -e "${testPassed} not finding $nonExistentFile"
fi
