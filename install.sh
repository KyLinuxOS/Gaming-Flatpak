#!/bin/bash

set -e

#Depots flatapk
flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo
flatpak remote-add --if-not-exists --user flathub-beta https://flathub.org/beta-repo/flathub-beta.flatpakrepo
flatpak update --appstream

# program list
progams=(
    "Steam"
    "ProtonGe"
    "PorotonUP-QT"
    "Lutris"
    "Flatseal"
    "Mangohud"
    "Discord"
#    "AppImageLauncher"
    "HeroicGameLauncher"
    "OpenRGB"
)

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


##AppImageLauncher() {
# echo "Installation de AppImageLauncher"
# mkdir -p $HOME/AppImage
# curl -o $HOME/AppImage/appimagelauncher https://github.com/TheAssassin/AppImageLauncher/releases/download/v2.2.0/appimagelauncher-lite-2.2.0-travis995-0f91801-x86_64.AppImage
#}

HeroicGameLauncher() {
 echo "Installation de HeroicGameLauncher"
 mkdir -p $HOME/AppImage
 curl -o $HOME/AppImage/Heroic-2.1.0.AppImage https://github.com/Heroic-Games-Launcher/HeroicGamesLauncher/releases/download/v2.1.0/Heroic-2.1.0.AppImage
}

OpenRGB() {
 echo "Installation de OpenRGB"
 mkdir -p $HOME/AppImage
 curl -o $HOME/AppImage/OpenRGB.AppImage https://gitlab.com/CalcProgrammer1/OpenRGB/-/jobs/artifacts/master/download?job=Linux+64+AppImage 
}

echo "### installation complete"

# auto select all
for i in ${!progams[@]}; do
    choices[i]="*"
done

menu() {
    echo "Choisir les programmes à installer :"

    for i in ${!progams[@]}; do
        printf "%3d%s) %s\n" $((i+1)) "${choices[i]:- }" "${progams[i]}"
    done
    [[ "$msg" ]] && echo "$msg"; :
}

prompt="Choisir un programme (choisir à nouveau pour l'enlever, ENTREE quand ok) : "

while menu && read -rp "$prompt" num && [[ "$num" ]]; do
    [[ "$num" != *[![:digit:]]* ]] &&
    (( num > 0 && num <= ${#progams[@]} )) ||
    { msg="Option invalide : $num"; continue; }
    ((num--));
    [[ "${choices[num]}" ]] && choices[num]="" || choices[num]="*"
done

printf "Vous avez choisi"; msg=" quedalle."

for i in ${!progams[@]}; do
    [[ "${choices[i]}" ]] && { printf " %s" "${progams[i]}"; msg=""; }
done

echo "$msg"

read -p "Installer (y/N)? " -n 1 -r
echo
if [[ $REPLY =~ ^[Yy]$ ]]
then
    for i in ${!progams[@]}; do
    option_noconfirm="true"
        [[ "${choices[i]}" ]] && ${progams[i]}
    done
fi
