source ../../source.sh

pkg="Work aliases"
payloadFile="$(getMyDir)/alias" # Cannot use ./ for symlinks
targetFile=$aliasDir/work.sh
