#=================  Install  =================

#_________________  Apt-Get  _________________
sudo apt-get update

for packageName in \
git
do
    clear
    printLine 60 "#"
    echo "Installing $packageName"
    sudo apt-get install $packageName
done

#_________________  Snap  _________________
sudo snap install --classic code
