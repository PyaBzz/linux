####################################################
##############                        ##############
##############  PyaBzz Customisation  ##############
##############                        ##############
####################################################

source ~/projects/bazLinux/bashSource/functions.sh

#=============  Function Definitions  ============

function printGreeting {
    
    local paddingLen=20
    local text="  Welcome $USER  "
    local textLen=${#text}
    local lineLen=2*paddingLen+textLen
    
    echo
    printLine lineLen "#"
    repeatText paddingLen "#" && repeatText textLen && repeatText paddingLen "#" && echo
    repeatText paddingLen "#" && printf "  Welcome $USER  " && repeatText paddingLen "#" && echo
    repeatText paddingLen "#" && repeatText textLen && repeatText paddingLen "#" && echo
    printLine lineLen "#"
    echo
    
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
