
# Read this page to enable a service to automatically sync local clock:

# https://unix.stackexchange.com/questions/60772/i-messed-up-my-system-clock-in-arch-linux

# To invoke such operation manually use this: sudo ntpd -qg

# sudo pacman -Syu ntp

# sudo systemctl enable ntpd.service

sudo systemctl enable systemd-timesyncd.service