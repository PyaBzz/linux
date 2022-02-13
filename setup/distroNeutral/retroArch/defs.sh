source ../../source.sh

redirectTo=$(getCallingScriptDir)/runHere # Cannot use ./ for symlinks

linkInstallDir() {
    ln -sf $redirectTo $configDir/retroarch
}
