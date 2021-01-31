source ../../importsForTesting.sh

scriptDir=$(pwd)
result=$(getCallingScriptDir)

echo $scriptDir
echo $result

if [ $scriptDir == $result ]; then
    result=${testPassed}
else
    result=${testFailed}
fi
echo -e "${result} getting directory"
