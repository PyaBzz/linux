shopt -s expand_aliases
alias getMyDir='echo "$(readlink -f "$(cd "$(dirname "${BASH_SOURCE[0]}")" >/dev/null 2>&1 && pwd)")"'

source $(getMyDir)/../bash/source.sh
