source ../../imports.sh

scriptFile=$0

# Todo: Colour output
if (fileExists $scriptFile); then
    echo "Passed finding $scriptFile"
else
    echo "Failed finding $scriptFile"
fi

nonExistentFile="nonExistentFile"

if (fileExists $nonExistentFile); then
    echo "Failed missing $nonExistentFile"
else
    echo "Passed not finding $nonExistentFile"
fi
