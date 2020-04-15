#!/bin/bash

cp ~/.bashrc ./source/bashrc-bak
echo "Backup created in ./source/bashrc-bak"

cat ./source/bashrc.txt >> ~/.bashrc
echo "Bash Mod Applied!"
