#!/bin/bash

set -e

#Depots flatapk
flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo
flatpak remote-add --if-not-exists --user flathub-beta https://flathub.org/beta-repo/flathub-beta.flatpakrepo
flatpak update --appstream

#Auto
flatpak install org.gnome.Platform/x86_64/41 flathub com.valvesoftware.Steam com.valvesoftware.Steam.CompatibilityTool.Proton-GE flathub-beta net.lutris.Lutris//beta flathub net.davidotek.pupgui2 flathub org.freedesktop.Platform.VulkanLayer.MangoHud org.openrgb.OpenRGB com.obsproject.Studio flathub com.spotify.Client flathub org.kde.kdenlive  flathub com.leinardi.gst


echo "### installation complete"


