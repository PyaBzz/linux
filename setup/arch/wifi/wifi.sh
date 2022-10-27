source ../source.sh

pkgMgrAskInstall networkmanager  # Unsure if this is necessary
# NetworkManager 

pkgMgrAskInstall network-manager-applet  # The widget in the panel
# nm-applet 

# sudo pacman -S nm-connection-editor  # GUI connection editor
# sudo nm-connection-editor 


# iwconfig      # lists interfaces
# iw dev      # lists interfaces

# ip link      # lists interfaces
# sudo ip link set wlp4s0 up  # supposedly enables the wifi interface
