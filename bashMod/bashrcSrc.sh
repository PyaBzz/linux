####################################################
##############                        ##############
##############  PyaBzz Customisation  ##############
##############                        ##############
####################################################

function getScriptDir {
    echo "$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"
}

source "$(getScriptDir)/../bashSource/functions.sh"

#=============  Function Definitions  ============

function printGreeting {
    
    local lineLen=41
    local text="Welcome $USER"
    local textLen=${#text}
    local paddingLen=$(((lineLen - textLen - 2) / 2))
    if [ $(($textLen % 2)) -eq 0 ]; then
        text="$text "
    fi

    cat << EOF
╔═══════════════════════════════════════╗
║ ##################################### ║
║ ##################################### ║
║ ########### # ########## # ########## ║
║          ######       ######          ║
║        ##########   ##########        ║
║          ######   #   ######          ║
║            #   ######   #             ║
║              ##########               ║
║                ######                 ║
║                  #                    ║
╠═══════════════════════════════════════╣
EOF
    printf "║" && repeatText paddingLen && printf "$text" && repeatText paddingLen && printf "║" && echo
    echo "╚═══════════════════════════════════════╝"
}

function setPromptStyle {
    local e='\[\033['  # Escape sequence
    export PS1="${e}95m\]\u${e}91m\]@${e}96m\]\h:${e}94m\]\w${e}93m\]$ ${e}0m\]"
}

function postInUpRightCorner {
    local len=${#1};
    local colour='\033[30;42m';
    
    tput sc;
    tput cup 0 $(($(tput cols)-len));
    printf "${colour}$1";
    tput rc;
}


function showDateTime {
    while sleep 1;do
        postInUpRightCorner "$(date +"%F @ %T")";
    done
}

#=====================  Apply  ===================

printGreeting
setPromptStyle
#showDateTime &   # To run in background

#===================  Aliases  ===================

alias baz='clear && ls -la'

#===================  Dynamic part  ===================

source "$(getScriptDir)/bashrcSrcDynamic.sh"
