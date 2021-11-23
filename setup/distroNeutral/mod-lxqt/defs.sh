source ../../../source.sh

sourcesDir="./conf-$hostName"
sources=($(ls $sourcesDir/*.conf))
targetDir=$HOME/.config/lxqt
