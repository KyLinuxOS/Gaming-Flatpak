#!/bin/bash

set -e

#Depots flatapk
flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo
flatpak remote-add --if-not-exists --user flathub-beta https://flathub.org/beta-repo/flathub-beta.flatpakrepo
flatpak update --appstream

#Dépendances
#flatpak install org.gnome.Platform/x86_64/41

# program list

Steam() {
  echo "Installation de steam"
 flatpak install flathub com.valvesoftware.Steam
}

ProtonGe() {
 echo "Installation de ProtonGe"
  flatpak install com.valvesoftware.Steam.CompatibilityTool.Proton-GE
}

PorotonUP-QT() {
 echo "Installation de PorotonUP-QT"
  flatpak install flathub net.davidotek.pupgui2
}

Lutris() {
 echo "Installation de Lutris"
flatpak install --user flathub-beta net.lutris.Lutris//beta
}

Flatseal() {
 echo "Installation de Flatseal"
flatpak install flathub com.github.tchx84.Flatseal
}

Mangohud() {
 echo "Installation de Mangohud"
flatpak install flathub org.freedesktop.Platform.VulkanLayer.MangoHud
}

Discord() {
 echo "Installation de Discord"
flatpak install flathub com.discordapp.Discord
}

OpenRGB() {
 echo "Installation de OpenRGB"
flatpak install flathub org.openrgb.OpenRGB
}

Spotify() {
 echo "Installation de Spotify"
flatpak install flathub com.spotify.Client
}

OBSSudio() {
 echo "Installation de OBS Studio"
flatpak install flathub com.obsproject.Studio
}

Kdenlive() {
 echo "Installation de Kdenlive"
flatpak install flathub org.kde.kdenlive
}

GtkStressTesting() {
 echo "Installation de GtkStressTesting"
flatpak install flathub com.leinardi.gst
}

echo "### installation complete"
