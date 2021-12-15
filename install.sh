#! /bin/bash
user=$(whoami)

# set correct time
sudo timedatectl set-timezone America/Los_Angeles

# install packages
xargs -a packages.txt sudo apt install -y
# sudo apt install x11-xserver-utils

# gen 8 intel and newer
# sudo apt install intel-media-va-driver-non-free libva-drm2 libva-x11-2


# crete default directories in home
xdg-user-dirs-update

# copy dwmbar, battery, and wall files to /bin/
cd bin
chmod +x dwmbar
chmod +x battery
chmod +x wall
sudo cp dwmbar /bin/dwmbar
sudo cp battery /bin/battery
sudo cp wall   /bin/wall
sudo cp polybar-forecast /bin/polybar-forecast
cd ..

cp -av Pictures /home/$user/Pictures

cp .xinitrc /home/$user/.xinitrc


# make the other scripts executable
chmod +x install-brave
chmod +x themes.sh
chmod +x fonts.sh


# build DWM and it's helpers
cd dwm-6.2
sudo make clean install
cd ..
cd dmenu-5.0
sudo make clean install
cd.. 
cd st-0.8.4
sudo make clean install
cd ..
cd slock
sudo make clean install
cd ..

# make st default terminal for nemo
gsettings set org.cinnamon.desktop.default-applications.terminal exec st


# if ever decide to go to pure DWM, below is package needed to enable color emoji
# libxft-bgra, support for color emoji
# git clone https://github.com/ra-c/libxft-bgra-debian.git
# cd libxft-bgra-debian
# ./configure
# make
# sudo make install
# cd ..
# rm -r libxft-bgra-debian
