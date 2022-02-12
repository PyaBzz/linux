source ../../source.sh

redirectTo=$(getCallingScriptDir)/runHere # Cannot use ./ for ln

linkInstallDir() {
    ln -sf $redirectTo $configDir/retroarch
}
