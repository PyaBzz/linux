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

clear
printLine 60 "#"
echo "Installing VisualStudio Code"
sudo snap install --classic code
