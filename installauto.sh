#!/bin/bash

set -e

#Depots flatapk
flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo
flatpak remote-add --if-not-exists --user flathub-beta https://flathub.org/beta-repo/flathub-beta.flatpakrepo
flatpak update --appstream

#Auto
flatpak install org.gnome.Platform/x86_64/41 com.discordapp.Discord com.valvesoftware.Steam com.valvesoftware.Steam.CompatibilityTool.Proton-GE net.davidotek.pupgui2 org.freedesktop.Platform.VulkanLayer.MangoHud org.openrgb.OpenRGB com.obsproject.Studio com.spotify.Client org.kde.kdenlive com.leinardi.gst

#Lutris
flatpak install --user flathub org.gnome.Platform.Compat.i386 org.freedesktop.Platform.GL32.default org.freedesktop.Platform.GL.default
flatpak install --user flathub-beta net.lutris.Lutris//beta

echo "### installation complete"
