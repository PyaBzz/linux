source ../../source.sh

openboxMyFile="$(getMyDir)/$hostName/openbox/rc.xml" # Cannot use ./ for symlinks
openboxLocalFile="$HOME/.config/openbox/rc.xml"

apply() {
    # backUp $openboxLocalFile
    ln -sfb $openboxMyFile $openboxLocalFile --suffix=.bazbak
}
