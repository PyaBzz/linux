source ../source.sh

bashrcFile=$HOME/.bashrc
appendageSource=./appendage.sh
appendageFile=$bashModDir/appendage.sh
aliasSource=./alias

appendToBashrc() {
    cat <<EOT >>$bashrcFile

#══════════════════  BazMod  ══════════════════
source $appendageFile

EOT
}

applyBashMod() {
    if (isBashModded); then
        if (askUser "Overwrite the existing mod?"); then
            echo "Overwriting mod ..."
            restoreFile $bashrcFile
        else
            echo "Skipped"
            return
        fi
    fi

    backUp $bashrcFile
    appendToBashrc
    copy $appendageSource to $appendageFile
    isAppendageRun=true
}

applyAliases() {
    if (isBashNotModded); then
        echo "Skipped aliases as bashMod hasn't been applied yet"
        return
    fi

    mkdir -p $aliasDir
    copy $aliasSource to $aliasDir/mod.sh
}
