user=$(whoami)

# install packages
xargs -a packages.txt sudo apt install -y

# copy dwmbar, battery, and wall files to /bin/
cd bin
chmod +x dwmbar
chmod +x battery
chmod +x wall
cp dwmbar /bin/dwmbar
cp battery /bin/battery
cp wall   /bin/wall
cd ..

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

