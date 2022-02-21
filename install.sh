#!/bin/bash

set -e

# automatic installation - use this with care and only if you know what you're doing
# this question will answer every question pacman asks with the default answer - it may break your system
option_noconfirm="true"


#Depots flatapk
flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo
flatpak remote-add --if-not-exists --user flathub-beta https://flathub.org/beta-repo/flathub-beta.flatpakrepo
#flatpak update --appstream

#Dépendances
flatpak install org.gnome.Platform/x86_64/41
flatpak install --user flathub org.gnome.Platform.Compat.i386 org.freedesktop.Platform.GL32.default org.freedesktop.Platform.GL.default

# program list

echo "Installation de steam"
 flatpak install flathub com.valvesoftware.Steam

echo "Installation de ProtonGe"
  flatpak install com.valvesoftware.Steam.CompatibilityTool.Proton-GE

echo "Installation de PorotonUP-QT"
  flatpak install flathub net.davidotek.pupgui2

echo "Installation de Lutris"
flatpak install --user flathub-beta net.lutris.Lutris//beta

echo "Installation de Flatseal"
flatpak install flathub com.github.tchx84.Flatseal

echo "Installation de Mangohud"
flatpak install flathub org.freedesktop.Platform.VulkanLayer.MangoHud

echo "Installation de Discord"
flatpak install flathub com.discordapp.Discord

echo "Installation de OpenRGB"
flatpak install flathub org.openrgb.OpenRGB

echo "Installation de Spotify"
flatpak install flathub com.spotify.Client

echo "Installation de OBS Studio"
flatpak install flathub com.obsproject.Studio

echo "Installation de Kdenlive"
flatpak install flathub org.kde.kdenlive

echo "Installation de GtkStressTesting"
flatpak install flathub com.leinardi.gst

echo "### installation complete"
