source ../../imports.sh

clear
scriptDir=$(pwd)
result=$(getCallingScriptDir)

echo $scriptDir
echo $result

if [ $scriptDir == $result ]; then
    echo -e "${testPassed} getting directory"
else
    echo -e "${testFailed} getting directory"
fi
