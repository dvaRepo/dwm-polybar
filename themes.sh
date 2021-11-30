# gtk theme
git clone https://github.com/vinceliuice/Orchis-theme.git
cd Orchis-theme/
./install.sh --tweaks compact
cd ..
rm -r Orchis-theme

# icon theme
git clone https://github.com/yeyushengfan258/Reversal-icon-theme.git
cd Reversal-icon-theme/
./install.sh -blue
cd ..
rm -r Reversal-icon-theme

user=$(whoami)

mkdir /home/$user/.config/gtk-3.0/
cp settings.ini /home/$user/.config/gtk-3.0/


git clone https://github.com/vinceliuice/WhiteSur-gtk-theme.git
cd WhiteSur-gtk-theme/
./install.sh -c dark -t blue -i debian
cd ..
rm -rf WhiteSur-gtk-theme/
