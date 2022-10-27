source ../../source.sh

payloadFile="$(getMyDir)/$hostName/openbox/rc.xml" # Cannot use ./ for symlinks
localFile="$HOME/.config/openbox/rc.xml"

apply() {
    mkdir -p $HOME/.config/openbox
    backUp $localFile
    ln -sfb $payloadFile $localFile --suffix=.bazbak
}
