# Add Windows to bootctl
sudo fdisk -l
sudo mkdir -p /mnt/boot
sudo mount /dev/nvme0n1p3 /mnt/boot
sudo cp -r /mnt/boot/EFI/Microsoft /boot/EFI/Microsoft
sudo umount /mnt/boot

# Wifi
nmcli dev wifi list
nmcli dev wifi connect "<name>" password "<password>"

# Copying files from Pendrive
sudo fdisk -l
sudo mkdir -p /mnt/pendrive
sudo mount /dev/sda /mnt/pendrive/
cp -r /mnt/pendrive/folder /path/to/folder
chown $USER -R /path/to/folder
sudo umount /mnt/pendrive/

# Install pacman Packages
sudo pacman -Syyuu
sudo pacman -S powerline-fonts ttf-fira-code noto-fonts noto-fonts-emoji noto-fonts-cjk noto-fonts-extra
fc-cache -f

sudo pacman -S polybar rofi
sudo pacman -S git picom base-devel zsh alacritty starship neofetch
sudo pacman -S thunar thunar-archive-plugin tumbler file-roller
sudo pacman -S dmenu htop arandr scrot xclip pavucontrol
sudo pacman -S opera opera-ffmpeg-codecs go telegram-desktop discord

# Install Paru Packages
git clone https://aur.archlinux.org/paru.git
cd paru/
makepkg -si

paru -S visual-studio-code-bin slack-desktop authy zoom betterlockscreen

# Docker
sudo pacman -S docker docker-compose
systemctl enable containerd.service
systemctl start containerd.service
systemctl status containerd.service
systemctl enable docker.service
systemctl start docker.service
systemctl status docker.service
sudo groupadd docker
sudo usermod -aG docker $USER
newgrp docker
docker run hello-world

# Dotfiles
git clone https://github.com/lcbm/dotfiles ~/.dotfiles
# TODO: bootstrap

# OpenVPN
paru -S openvpn3 openvpn-update-systemd-resolved
ls /etc/openvpn3/
systemctl status systemd-resolved.service
systemctl enable systemd-resolved.service
systemctl start systemd-resolved.service
# sudo openvpn \
#  --script-security 3 \
#  --config /path/to/file.ovpn \
#  --auth-retry interact \
#  --auth-user-pass /path/to/credentials.txt

# Adding Kernel Parameters
sudo vim /boot/loader/entries/2022-07-05_04-46-00_linux.conf # to the right side of 'options', add kernal parameter
sudo bootctl update
reboot

cat /proc/cmdline # checks if changes were applied correctly
btrfsck --init-extent-free
btrfsck check --init-extent-free

# History
