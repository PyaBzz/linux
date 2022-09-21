source ../source.sh

echo "Enables colourful emoji icons for Instagram web"

pkgMgrAskInstall noto-fonts-emoji
fc-cache -f -v
