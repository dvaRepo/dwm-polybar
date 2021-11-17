#! /bin/bash
user=$(whoami)

# install packages
xargs -a packages.txt sudo apt install -y
sudo apt install x11-xserver-utils

# ulauncher
wget https://github.com/Ulauncher/Ulauncher/releases/download/5.14.2/ulauncher_5.14.2_all.deb
sudo dpkg -i ulauncher_5.14.2_all.deb
rm ulauncher_5.14.2_all.deb
sudo apt --fix-broken install
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
