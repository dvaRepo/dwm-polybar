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
cp dwmbar /bin/dwmbar
cp battery /bin/battery
cp wall   /bin/wall
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

# fonts
# make an ubuntu font folder
sudo mkdir /usr/share/fonts/truetype/ubuntu-fonts
# download ubuntu font family
wget https://assets.ubuntu.com/v1/fad7939b-ubuntu-font-family-0.83.zip
#unzip downloaded file
unzip *.zip
# change directories into unzipped ubuntu font folder
cd ubuntu-font-family*
# move everything ending in ".ttf"  into the ubuntu font folder we created earlier
sudo mv *.ttf /usr/share/fonts/truetype/ubuntu-fonts/
# change directories back to home
cd ..
# remove all files ending in ".zip"
rm *.zip
# remove all folders beginning with "ubuntu-font-family"
rm -r ubuntu-font-family*

# make Font Awesome font folders
sudo mkdir /usr/share/fonts-font-awesome
sudo mkdir /usr/share/fonts/opentype/font-awesome
sudo mkdir /usr/share/fonts/svg/font-awesome
# download and extract font-awesome font
wget https://github.com/FortAwesome/Font-Awesome/releases/download/5.15.4/fontawesome-free-5.15.4-desktop.zip
unzip fontawesome-free-5.15.4-desktop.zip
# move the extracted font to the folder created before
cd fontawesome-free-5.15.4-desktop/
sudo mv * /usr/share/fonts-font-awesome
cd otfs/
sudo mv *.otf /usr/share/fonts/opentype/font-awesome
cd ..
cd svgs/
sudo mv * /usr/share/fonts/svg/font-awesome
# clean up
cd ..
cd ..
rm -r fontawesome-free*
