source ../../source.sh

redirectTo=$(getCallingScriptDir)/runHere

linkInstallDir() {
    ln -sf $redirectTo $configDir/retroarch
}
