#!/bin/bash
# JItsi Broadcasting Infrastructure (Jibri) configuration
# For Ubuntu:
# Install the module
sudo apt update -y && sudo apt install -y linux-image-extra-virtual
# Configure 5 capture/playback interfaces
echo "options snd-aloop enable=1,1,1,1,1 index=0,1,2,3,4" | sudo tee -a /etc/modprobe.d/alsa-loopback.conf > /dev/null
# Setup autoload the module
echo "snd-aloop" | sudo tee -a /etc/modules > /dev/null
# Modify GRUB_DEFAULT and update GRUB
sudo sed -i 's/GRUB_DEFAULT=0/GRUB_DEFAULT="1>2"/g' /etc/default/grub
sudo update-grub
# Reboot the machine
sudo reboot now
