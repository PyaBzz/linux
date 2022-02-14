source ../../source.sh

redirectTo=$(getMyDir)/runHere # Cannot use ./ for symlinks

linkInstallDir() {
    ln -sf $redirectTo $configDir/retroarch
}
