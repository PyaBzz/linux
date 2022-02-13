myDir="$(readlink -f "$(cd "$(dirname "${BASH_SOURCE[0]}")" >/dev/null 2>&1 && pwd)")"
source $myDir/../bash/source.sh
source $myDir/pkgMgr.sh
mediaDir=$myDir/media