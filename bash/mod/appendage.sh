#════════════════════════════  Definitions  ════════════════════════════

repeatSpace() {
    # synopsis: repeatSpace <NumberOfRepetitions>
    local output=""
    for ((i = 1; i <= $1; i++)); do
        output+=" "
    done
    echo "$output"
}

printGreeting() {
    local lineLen=41
    local greeting="Hi $(whoami) !"
    local greetingLen=${#greeting}
    if [ $(($greetingLen % 2)) -eq 0 ]; then
        greeting+=" "
    fi

    local paddingLen=$(((lineLen - greetingLen - 2) / 2))
    padding=$(repeatSpace paddingLen)

    local greetingLine="║$padding$greeting$padding║"

    cat <<anArbitraryName
╔═══════════════════════════════════════╗
$greetingLine
╚═══════════════════════════════════════╝
anArbitraryName
}

setPromptStyle() {
    local e='\[\033[' # Escape sequence
    export PS1="${e}95m\]\u${e}91m\]@${e}96m\]\h:${e}94m\]\w${e}93m\]$ ${e}0m\]"
}

#════════════════════════════  Apply  ════════════════════════════

printGreeting
setPromptStyle
export isAppendageRun=true

#════════════════════════════  Aliases  ════════════════════════════
bashModDir="$(readlink -f "$(cd "$(dirname "${BASH_SOURCE[0]}")" >/dev/null 2>&1 && pwd)")"

for f in $bashModDir/alias/applied/*.sh; do source $f; done

#════════════════════════════  Navigate  ════════════════════════════

export proj=$HOME/proj
cd $proj
