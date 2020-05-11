#!/bin/bash

function askUser {
 local res=$1
 if [ -z "$2" ]
 then
  local confirm
  read -p "Proceed? (Y/N): " confirm
 else
  read -p "$2 (Y/N): " confirm
 fi

 if [[ $confirm == [yY] || $confirm == [yY][eE][sS] ]]
 then
  eval $res=true
 else
  eval $res=false
 fi
}

function applyBazMod {
 if [ -f bashrc/backup ];
 then
  echo "Backup file exists!"
  local shouldOverWrite
  askUser shouldOverWrite "Shall we?"
  echo $shouldOverWrite
  if [ $shouldOverWrite == true ]; then
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

applyBazMod
