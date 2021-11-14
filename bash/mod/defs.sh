source ../source.sh

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
        else
            echo "Skipped"
            return
        fi
    else
        backUp $bashrcFile
        appendToBashrc
        mkdir -p $aliasDir
    fi

    copyFile $appendageSource to $appendageFile
    isAppendageRun=true
}

applyAliases() {
    if (isBashNotModded); then
        echo "Skipped aliases as bashMod hasn't been applied yet"
        return
    fi

    copyFile $aliasSource to $aliasDir/mod.sh
}
