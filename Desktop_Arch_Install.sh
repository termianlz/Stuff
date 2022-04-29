#!/bin/bash

pacman -Syu

ln -sf /usr/share/zoneinfo/Europe/London /etc/localtime
hwclock --systohc
sed -i '/en_GB.UTF-8/s/^#//g' /etc/locale.gen
locale-gen
echo "LANG=en_GB.UTF-8" >> /etc/locale.conf
echo "KEYMAP=uk" >> /etc/vconsole.conf
echo "desktop" >> /etc/hostname
passwd

# uncoment 32 bit repo

pacman -S base-devel linux-headers networkmanager network-manager-applet nm-connection-manager wpa_supplicant dialog bluez bluez-utils cups hplip reflector xdg-{user-dirs,utils,desktop-{portal,portal-kde}} gvfs gvfs-{mtp,gphoto2,afc,smb} mtools dosfstools ntfs-3g btrfs-progs exfatprogs exfat-utils f2fs-tools e2fsprogs jfsutils nilfs-utils reiserfsprogs udftools xfsprogs moosefs minio go-ipfs glusterfs ceph squashfs-tools erofs-utils unionfs-fuse ecryptfs-utils nfs-utils inetutils dnsutils avahi openssh alsa-utils pipewire pipewire-{alsa,pulse,jack} lib32-{pipewire,pipewire-jack,libpulse,alsa-{lib,plugins}} helvum pavucontrol easyeffects bash-completion rsync acpi acpi-call acpid tlp firewalld flatpak sof-firmware nss-mdns vulkan-icd-loader lib32-vulkan-icd-loader wine wine-{mono,gecko} p7zip virt-manager qemu libvirt edk2-ovmf dnsmasq vde2 bridge-utils openbsd-netcat iptables-nft dmidecode qemu-{arch-extra,block-{gluster,iscsi,rbd}} swtpm xorg xorg-{server,apps} plasma-meta konsole sddm grub efibootmgr os-prober neofetch btop git

pacman -S nvidia nvidia-{utils,settings} lib32-{nvidia-utils,opencl-nvidia} opencl-nvidia

systemctl enable NetworkManager
systemctl enable bluetooth
systemctl enable cups.service
systemctl enable sshd
systemctl enable avahi-daemon
systemctl enable tlp
systemctl enable reflector.timer
systemctl enable fstrim.timer
systemctl enable firewalld
systemctl enable acpid
systemctl enable libvirtd.service
systemctl enable sddm

useradd -m leon
passwd leon
usermod -aG wheel libvirt leon

# give wheel group sudo privaleges

git clone https://aur.archlinux.org/paru-bin.git
cd paru-bin
makepkg -si
cd