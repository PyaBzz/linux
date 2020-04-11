#!/bin/bash

cp ~/.bashrc ~/.bashrc-bak
echo "Backup created in .bashrc-bak"

cat ./source/bashrc.txt >> ~/.bashrc
echo "Bash Mod Applied!"
