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
 local shouldChangeBashrc
 askUser shouldChangeBashrc "Mod bashrc?"
 if [ $shouldChangeBashrc == true ]
 then
  if [ -f bashrc/backup ];
  then
   echo "Backup file exists!"
   local shouldOverWrite
   askUser shouldOverWrite "Overwrite it?"
   if [ $shouldOverWrite == true ]; then
     echo "Overwriting backup file ..."
     cp ~/.bashrc ./bashrc/backup
     echo "Backup saved in ./bashrc/backup"
     cat ./bashrc/source >> ~/.bashrc
     echo "Bashrc Mod Applied!"
   else
     echo "Skipping bashrc ..."
   fi
  fi

 else
  echo "Skipping bashrc ..."
 fi

 local shouldModifyPackages
 askUser shouldModifyPackages "Mod packages?"
 if [ $shouldModifyPackages == true ]
 then
  source lubuntu-19.10/initialise.sh
  echo "All done!"
 else
  echo "Quitting ..."
 fi
}

applyBazMod
