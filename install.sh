#! /bin/bash
user=$(whoami)

# install weather font
sudo apt install npm
npm install weather-icons-npm
sudo apt autorempve npm

# install packages
xargs -a packages.txt sudo apt install -y
sudo apt install x11-xserver-utils

# gen 8 intel and newer
# sudo apt install intel-media-va-driver-non-free libva-drm2 libva-x11-2

# copy dwmbar, battery, and wall files to /bin/
cd bin
chmod +x dwmbar
chmod +x battery
chmod +x wall
sudo cp dwmbar /bin/dwmbar
sudo cp battery /bin/battery
sudo cp wall   /bin/wall
cd ..

cp -av Pictures /home/$user/Pictures

cp .xinitrc /home/$user/.xinitrc


# libxft-bgra, support for color emoji
git clone https://github.com/ra-c/libxft-bgra-debian.git
cd libxft-bgra-debian
./configure
make
sudo make install
cd ..

# crete default directories in home
xdg-user-dirs-update

# make the other scripts executable
chmod +x install-brave
chmod +x themes.sh
chmod +x fonts.sh

rm -r libxft-bgra-debian
