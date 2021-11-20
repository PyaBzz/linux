source ../../source.sh

askToProceed "Set up software RAID?"

pkgMgrAskInstall "mdadm"

echo -e "${colourYellow}Read comments in the script for the next steps${colourNc}"

# Identify your block storage devices: lsblk
# Get info about mounted partitions: df -h
# See details of your partitions: sudo blkid
# Partitions that already constitute a RAID volume have this ID: A19D880F-05FC-4D3B-A006-743F0F84911E

# Create ${colourYellow}GPT${colourNc} partitions on your storage devices: sudo fdisk
# Set their size exactly the same in Mega Bytes with +XXXM in new partition wizard
# Set the size slightly (e.g -200M) smaller than the max of the device
# Label them raid-a and raid-b in expert options

# Create the array:
#   sudo mdadm --create --verbose /dev/md127 --level=1 --raid-devices=2 /dev/sda1 /dev/sdb1
# Check syncing status of the array: cat /proc/mdstat
# You can write to the array while it is syncing
# See details of the array: sudo mdadm --detail /dev/md127
# To preserve array details in config files for future ref: mdadm --detail --scan >> /etc/mdadm.conf

# Make a file system on the new raid partition: sudo mkfs.ext4 /dev/md127
# Mount it: sudo mount /dev/md127 /bazRaid/

# Optional, append this line to /etc/fstab to mount the partition upon boot:
# /dev/md127  /bazRaid  ext4  errors=remount-ro  0  0
# To manually run fstab and mount all: sudo mount -a
