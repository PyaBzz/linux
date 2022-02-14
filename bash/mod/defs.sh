source ../source.sh

bashRcFile=$HOME/.bashrc
appendageFile=$(getMyDir)/appendage.sh

appendToBashrc() {
    cat <<EOT >>$bashRcFile

#══════════════════  BazMod  ══════════════════
source $appendageFile

EOT
}

applyBashMod() {
    if (isBashModded); then
        echo "Skipped as your Bash is already modded"
        return
    fi

    backUp $bashRcFile
    appendToBashrc
    isAppendageRun=true
}
