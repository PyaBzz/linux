source ../../source.sh

srcFile=./retroarch.cfg
targetDir=~/.config/retroarch

cloneConfigRepo() {
    git clone git@github.com:PyaBzz/retroarch.git $targetDir
}
