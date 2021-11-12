user=$(whoami)

# install necessary packages for Virtm Manager(KVM)
sudo apt install install qemu-kvm libvirt-daemon  bridge-utils virtinst libvirt-daemon-system install virt-top libguestfs-tools libosinfo-bin  qemu-system virt-manager


# enable Virtual Manger (KVM)
#sudo systemctl enable libvirtd.service
#sudo systemctl start libvirtd.service
#add your user to the libvirt group
#sudo newgrp libvirt
#sudo usermod -a -G libvirt $user
#sudo usermod -a -G kvm $user

# enable normal user to use KVM
#cd /etc/libvirt/
#sudo sed -i '/unix_sock_group/s/^#//g' libvirtd.conf
#sudo sed -i '/unix_sock_rw_perms/s/^#//g' libvirtd.conf
#cd /home/$user/.src/dwm
# restart libvirt
#sudo systemctl restart libvirtd.service
