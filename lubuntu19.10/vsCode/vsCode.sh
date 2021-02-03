source ../../source.sh

packageName="VS Code"

if (askUserClear "Install $packageName?"); then
    echo "Installing $packageName"
    sudo snap install --classic code
else
    echo "Skipped $packageName"
fi

# if (askUser "Apply config?"); then
#     settingFilePath=~/.config/Code/User/settings.json
#     backupFilePath=~/.config/Code/User/settings.json.bazbak
#     if (dirMissing ~/.config/Code); then
#         mkdir ~/.config/Code
#     fi
#     if (dirMissing ~/.config/Code/User); then
#         mkdir ~/.config/Code/User
#     fi

#     if (fileExists $settingFilePath); then
#         echo "Setting file exists!"

#         if (fileExists $backupFilePath); then
#             echo "Backup file exists!"

#             if (askUser "Overwrite the backup with a new one?"); then
#                 echo "Overwriting backup file ..."
#                 cp $settingFilePath $backupFilePath
#                 echo "Backup saved in $backupFilePath"
#             else
#                 echo "Leaving backup file untouched"
#             fi
#         else
#             cp $settingFilePath $backupFilePath
#             echo "Backup saved in $backupFilePath"
#         fi
#     fi

#     cp ./settings.json $settingFilePath
#     echo "Settings applied!"
# else
#     echo "Skipped config"
# fi
