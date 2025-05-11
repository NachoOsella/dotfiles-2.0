#!/bin/bash

# Verificar si se está ejecutando como root
if [[ $EUID -ne 0 ]]; then
   echo "Este script debe ejecutarse como root (usá sudo)." 
   exit 1
fi

echo "==> Instalando paquetes con pacman..."

pacman -S --needed --noconfirm \
alsa-firmware alsa-utils base base-devel brightnessctl dunst efibootmgr fastfetch \
fd feh firefox fzf ghostscript git grim gst-plugin-pipewire htop hypridle hyprland \
hyprlock hyprpaper hyprpicker hyprshot imagemagick intel-media-driver intel-ucode \
iwd jdk-openjdk keepassxc kitty kvantum-qt5 lazygit libnotify libpulse \
libva-intel-driver linux linux-firmware lsd maven nano neovim nodejs noto-fonts \
noto-fonts-cjk noto-fonts-emoji npm openssh papirus-icon-theme pcmanfm-qt \
pipewire pipewire-alsa pipewire-jack pipewire-pulse polkit-kde-agent python-dbus \
python-gobject python-pip qt5-wayland qt5ct qt6-virtualkeyboard qt6-wayland qt6ct \
rofi-wayland sddm slurp smartmontools sof-firmware starship steam \
ttf-dejavu ttf-jetbrains-mono-nerd ttf-liberation unrar unzip vim \
visual-studio-code-bin vlc vulkan-intel waybar wget wireless_tools wireplumber \
wlogout wpa_supplicant xdg-desktop-portal-hyprland xdg-utils xorg-server \
xorg-xinit yay yay-debug yazi zathura zip zoxide zram-generator zsh \
zsh-autosuggestions zsh-syntax-highlighting

echo "==> Instalando spotify-launcher y vesktop con yay..."

yay -S --needed --noconfirm spotify-launcher vesktop

echo "✅ Instalación completa."

