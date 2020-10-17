####################################################
##############                        ##############
##############  PyaBzz Customisation  ##############
##############                        ##############
####################################################

source ~/.bashMod/functions.sh

#=============  Function Definitions  ============

function printGreeting {
    
    local lineLen=41
    local greeting="Hi $USER !"
    local greetingLen=${#greeting}
    if [ $(($greetingLen % 2)) -eq 0 ]; then
        greeting+=" "
    fi

    local paddingLen=$(((lineLen - greetingLen - 2) / 2))
    padding=$(echoRepeatText paddingLen)

    local greetingLine="║$padding$greeting$padding║"

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
$greetingLine
╚═══════════════════════════════════════╝
EOF
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

for f in ~/.bashMod/aliases/*.sh; do source $f; done
