#!/bin/bash

function bashMod {
 if [ -f bashrc/backup ]; then
  echo "Backup file exists!"
  read -p "Overwrite it? (Y/N): " confirm

  if [[ $confirm == [yY] || $confirm == [yY][eE][sS] ]]; then
    echo "Overwriting backup file ..."
  else
    return
  fi
 fi

 cp ~/.bashrc ./bashrc/backup
 echo "Backup saved in ./bashrc/backup"

 cat ./bashrc/source >> ~/.bashrc
 echo "Bash Mod Applied!"
}

bashMod
