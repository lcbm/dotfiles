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

# Android Studio: Emulator from Command Line
# - https://wiki.archlinux.org/title/android#Run_Android_apps_on_Arch_Linux
#
# This was required because of issues I was having with the emulator not starting from Android Studio:
# - "qemu-system-x86_64: error while loading state for instance 0x0 of device 'kvm-tpr-opt'"
paru -S android-emulator android-sdk-cmdline-tools-latest android-sdk-build-tools android-sdk-platform-tools android-platform
sudo groupadd android-sdk
sudo gpasswd -a $USER android-sdk
sudo setfacl -R -m g:android-sdk:rwx /opt/android-sdk
sudo setfacl -d -m g:android-sdk:rwX /opt/android-sdk
newgrp android-sdk
sdkmanager "system-images;android-29;google_apis_playstore;x86_64"
avdmanager create avd -n SomeName -k "system-images;android-29;google_apis_playstore;x86_64" -d "Fixed POS/Kitchen/Runner"
vim ~/.android/avd/SomeName.avd/config.ini # change hw.keyboard=yes
emulator -avd SomeName
adb install /path/to/my.apk

# History
