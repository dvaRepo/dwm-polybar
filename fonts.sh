#! /bin/bash
# fonts

# install weather font
sudo apt install npm
npm install weather-icons-npm
sudo apt autorempve npm
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
cd otfs/
sudo cp -r *.otf /usr/share/fonts/opentype/font-awesome
cd ..
cd svgs/
sudo cp -r * /usr/share/fonts/svg/font-awesome
cd ..
sudo cp -r * /usr/share/fonts-font-awesome
# clean up
cd ..
rm -r fontawesome-free*

