#!/bin/bash

if [ -f source/.bashrc-bak ]; then
 echo "Backup file exists!"
 read -p "Overwrite it? (Y/N): " confirm

 if [[ $confirm == [yY] || $confirm == [yY][eE][sS] ]]; then
   echo "Overwriting backup file ..."
 else
   return
 fi
fi

cp ~/.bashrc ./source/.bashrc-bak
echo "Backup saved in ./source/.bashrc-bak"

cat ./source/bashrc.txt >> ~/.bashrc
echo "Bash Mod Applied!"
