source ../../source.sh

package="git"

if (askUserClear "Install $package?"); then
    packageManagerUpdate
    ${packageManagerUpdate}
    echo "Installing $package"
    # sudo apt-get install $package
    echo "$package installed"
else
    echo "Skipped $package"
fi

# package="aliases"
# if (askUser "Apply $package?"); then
#     if (isBashModded); then
#         copyFile ./alias to $aliasDir/git.sh
#         echo "$package applied"
#     else
#         echo "Skipped $package as bashMod hasn't been applied yet"
#     fi
# else
#     echo "Skipped $package"
# fi

# package="global config"
# if (askUser "Apply $package?"); then
#     git config --global user.name pyabzz
#     git config --global user.email ""
#     echo "$package applied"
# else
#     echo "Skipped $package"
# fi
