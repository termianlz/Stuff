#!/bin/bash

pacman -Syu

ln -sf /usr/share/zoneinfo/Europe/London /etc/localtime
hwclock --systohc
sed -i '/en_GB.UTF-8/s/^#//g' /etc/locale.gen
locale-gen
echo "LANG=en_GB.UTF-8" >> /etc/locale.conf
echo "KEYMAP=uk" >> /etc/vconsole.conf
echo "desktop" >> /etc/hostname
echo root:3993 | chpasswd

# uncoment 32 bit repo

pacman -S base-devel linux-headers networkmanager network-manager-applet nm-connection-editor wpa_supplicant dialog bluez bluez-utils cups hplip reflector xdg-{user-dirs,utils,desktop-portal-kdewlr} gvfs gvfs-{mtp,gphoto2,afc,smb} mtools dosfstools ntfs-3g btrfs-progs exfatprogs exfat-utils f2fs-tools e2fsprogs jfsutils nilfs-utils reiserfsprogs udftools xfsprogs moosefs minio go-ipfs glusterfs ceph squashfs-tools erofs-utils unionfs-fuse ecryptfs-utils nfs-utils inetutils dnsutils avahi openssh alsa-utils pipewire pipewire-{alsa,pulse,jack} lib32-{pipewire,pipewire-jack,libpulse,alsa-{lib,plugins}} helvum pavucontrol easyeffects bash-completion rsync acpi acpi_call acpid tlp firewalld flatpak sof-firmware nss-mdns vulkan-icd-loader lib32-vulkan-icd-loader wine wine-{mono,gecko} p7zip virt-manager qemu libvirt edk2-ovmf dnsmasq vde2 bridge-utils openbsd-netcat iptables-nft dmidecode qemu-{arch-extra,block-{gluster,iscsi,rbd}} swtpm efibootmgr neofetch btop sl lf snapper

# pacman -S nvidia nvidia-{utils,settings} lib32-{nvidia-utils,opencl-nvidia} opencl-nvidia
# pacman -S xf86-video-amdgpu vulkan-radeon lib32-vulkan-radeon

# pacman -S xorg xorg-{server,apps}

# pacman -S plasma-meta sddm sddm-kcm konsole
# systenctl enable sddm.service

# pacman -S sway swaylock swayidle dmenu alacritty xorg-xwayland
# systemctl enable gdm.service

# pacman -S grub os-prober grub-btrfs
# grub-install --target=x86_64-efi --efi-directory=/boot --bootloader-id=GRUB
# grub-mkconfig -o /boot/grub/grub.cfg

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

useradd -m leon
echo leon:3993 | chpasswd
usermod -aG wheel libvirt leon

# give wheel group sudo privaleges
