#!/bin/bash

# Black        0;30     Dark Gray     1;30
# Red          0;31     Light Red     1;31
# Green        0;32     Light Green   1;32
# Brown/Orange 0;33     Yellow        1;33
# Blue         0;34     Light Blue    1;34
# Purple       0;35     Light Purple  1;35
# Cyan         0;36     Light Cyan    1;36
# Light Gray   0;37     White         1;37

RED='\033[0;31m'
GREEN='\033[0;32m'
CYAN='\033[0;36m'
YELLOW='\033[0;33m'
NC='\033[0m'

THEMES_DIR="${HOME}/.local/share/themes"
ICONS_DIR="${HOME}/.local/share/icons"

THEME_FILES_PATH="${THEMES_DIR}/OmTheme"
ICONS_FILES_PATH="${ICONS_DIR}/OmTheme"

RUID=$(who | awk 'FNR == 1 {print $1}')
RUSER_UID=$(id -u ${RUID})


function printRed() {
  printf "${RED}$1${NC}\n"
}

function printGreen() {
  printf "${GREEN}$1${NC}\n"
}

function printCyan() {
  printf "${CYAN}$1${NC}\n"
}

function printYellow() {
  printf "${YELLOW}$1${NC}\n"
}

printCyan "\nPlease, answer some questions with numbers, 1, 2, 3... and so on!"
printCyan "That way you're going to know exactly what I'm going to do...\n"

installTheme=""
while [[ $installTheme != "1" && $installTheme != "2" ]]; do
  if [[ ${installTheme} != "" ]]; then
    printRed "\nPlease, use the numbers to answer!\n"
    printCyan "Let me ask you again..."
  fi
  
  printYellow "\nDo you want to install OmTheme?\n"
  printGreen "1) Yes"
  printGreen "2) No"
  read -p "Your turn [1, 2]: " installTheme
done;

if [[ ${installTheme} != "1" ]]; then
  printCyan "\nOk, I won't!"
  printCyan "BYEE!"
  exit
else
  printCyan "\nOk, I have some more questions..."
  printCyan "Don't worry, it'll be super fast =)"
fi


copyFiles=""
while [[ $copyFiles != "1" && $copyFiles != "2" ]]; do
  if [[ ${copyFiles} != "" ]]; then
    printRed "\nPlease, use the numbers to answer!\n"
    printCyan "Let me ask you again..."
  fi
  
  printYellow "\nI'm going to copy the files to \"${THEME_FILES_PATH}\"."
  printYellow "Is that ok?\n"
  printGreen "1) Yes"
  printGreen "2) No"
  read -p "Your turn [1, 2]: " copyFiles
done;

if [[ ${copyFiles} != "1" ]]; then
  printCyan "\nOk, I won't!"
  printCyan "BYEE!"
  exit
else
  printCyan "\nOk, I will copy the files in a moment..."
fi

iconsTheme=""
while [[ $iconsTheme != "1" && $iconsTheme != "2" ]]; do
  if [[ ${iconsTheme} != "" ]]; then
    printRed "\nPlease, use the numbers to answer!\n"
    printCyan "Let me ask you again..."
  fi
  
  printYellow "\nDo you want me to copy icon files to \"${ICONS_FILES_PATH}\"."
  printCyan "The icons are not required, but they are nice!\n"
  printGreen "1) Yes"
  printGreen "2) No"
  read -p "Your turn [1, 2]: " iconsTheme
done;

if [[ ${iconsTheme} != "1" ]]; then
  printCyan "\nOk, I won't!"
else
  printCyan "\nOk, I'll copy the icons as soon as we're done here..."
fi

setTheme=""
while [[ $setTheme != "1" && $setTheme != "2" ]]; do
  if [[ ${setTheme} != "" ]]; then
    printRed "\nPlease, use the numbers to answer!\n"
    printCyan "Let me ask you again..."
  fi
  
  printYellow "\nDo you want me to apply the theme when I'm done?"
  printGreen "1) Yes"
  printGreen "2) No"
  read -p "Your turn [1, 2]: " setTheme
done;

if [[ ${setTheme} != "1" ]]; then
  printCyan "\nOk, I won't!"
else
  printCyan "\nOk, I'll set the theme for you..."
fi

setIcons=""
while [[ $setIcons != "1" && $setIcons != "2" ]]; do
  if [[ ${setIcons} != "" ]]; then
    printRed "\nPlease, use the numbers to answer!\n"
    printCyan "Let me ask you again..."
  fi
  
  printYellow "\nDo you want me to apply the icons theme when I'm done?"
  printGreen "1) Yes"
  printGreen "2) No"
  read -p "Your turn [1, 2]: " setIcons
done;

if [[ ${setIcons} != "1" ]]; then
  printCyan "\nOk, I won't!"
else
  printCyan "\nOk, I'll set the icons for you..."
fi

confirmation=""
while [[ $confirmation != "1" && $confirmation != "2" ]]; do
  if [[ ${confirmation} != "" ]]; then
    printRed "\nPlease, use the numbers to answer!\n"
    printCyan "Let me ask you again..."
  fi
  
  printYellow "\nPlease, confirm your answers?\n"

  if [[ ${installTheme} == "1" ]]; then
    printCyan "You want me to install OmTheme"
  fi
  
  if [[ ${copyFiles} == "1" ]]; then
    printCyan "You want me to copy the theme files to ${THEME_FILES_PATH}"
  else
    printRed "You DON'T want me to copy the theme files to ${THEME_FILES_PATH}"
  fi

  if [[ ${iconsTheme} == "1" ]]; then
    printCyan "You want me to copy the icon files to ${ICONS_FILES_PATH}"
  else
    printRed "You DON'T want me to copy the icons files to ${ICONS_FILES_PATH}"
  fi

  if [[ ${setTheme} == "1" ]]; then
    printCyan "You want me to set the theme for you"
  else
    printRed "You DON'T want me to set the theme for you"
  fi

  if [[ ${setIcons} == "1" ]]; then
    printCyan "You want me to set the icons theme for you"
  else
    printRed "You DON'T want me to set the icons theme for you"
  fi

  printGreen "\n1) Yes"
  printGreen "2) No"
  read -p "Your turn [1, 2]: " confirmation
done;

if [[ ${confirmation} != "1" ]]; then
  printCyan "\nOk, I won't!"
else
  printCyan "\nOk, now I'm going to do my job..."
fi

if [[ ${copyFiles} == "1" ]]; then
  if [[ ! -d "$THEMES_DIR" ]]; then
    mkdir -p $THEMES_DIR
  fi

  cp -R ./OmTheme $THEME_FILES_PATH
  printCyan "\nTheme files copied to ${THEME_FILES_PATH}..."
fi

if [[ ${setTheme} == "1" ]]; then
  sudo apt update -y
  sudo apt install -y gnome-shell-extensions
  sudo apt install -y gsettings-desktop-schemas
  gnome-extensions enable 'user-theme@gnome-shell-extensions.gcampax.github.com'

  sudo -u ${RUID} DBUS_SESSION_BUS_ADDRESS="unix:path=/run/user/${RUSER_UID}/bus" gsettings set org.gnome.desktop.interface gtk-theme "OmTheme" 2> /dev/null
  sudo -u ${RUID} DBUS_SESSION_BUS_ADDRESS="unix:path=/run/user/${RUSER_UID}/bus" gsettings set org.gnome.desktop.interface cursor-theme "DMZ-Black" 2> /dev/null
  sudo -u ${RUID} DBUS_SESSION_BUS_ADDRESS="unix:path=/run/user/${RUSER_UID}/bus" gsettings set org.gnome.desktop.wm.preferences theme "OmTheme" 2> /dev/null
  sudo -u ${RUID} DBUS_SESSION_BUS_ADDRESS="unix:path=/run/user/${RUSER_UID}/bus" gsettings set org.gnome.desktop.wm.preferences button-layout ':minimize,maximize,close' 2> /dev/null
  sudo -u ${RUID} DBUS_SESSION_BUS_ADDRESS="unix:path=/run/user/${RUSER_UID}/bus" gsettings set org.gnome.shell.extensions.dash-to-dock apply-custom-theme true 2> /dev/null
  sudo -u ${RUID} DBUS_SESSION_BUS_ADDRESS="unix:path=/run/user/${RUSER_UID}/bus" gsettings set org.gnome.shell.extensions.dash-to-dock custom-theme-customize-running-dots true 2> /dev/null
  sudo -u ${RUID} DBUS_SESSION_BUS_ADDRESS="unix:path=/run/user/${RUSER_UID}/bus" gsettings set org.gnome.shell.extensions.dash-to-dock dock-position 'BOTTOM' 2> /dev/null
  sudo -u ${RUID} DBUS_SESSION_BUS_ADDRESS="unix:path=/run/user/${RUSER_UID}/bus" gsettings set org.gnome.shell.extensions.dash-to-dock extend-height false 2> /dev/null
  sudo -u ${RUID} DBUS_SESSION_BUS_ADDRESS="unix:path=/run/user/${RUSER_UID}/bus" gsettings set org.gnome.shell.extensions.user-theme name "OmTheme" 2> /dev/null

  printCyan "\nTheme OmTheme is activated..."
fi

if [[ ${iconsTheme} == "1" ]]; then
  if [[ ! -d "$ICONS_DIR" ]]; then
    mkdir -p $ICONS_DIR
  fi

  cp -R './yaru-blue-with-breeze' $ICONS_FILES_PATH
  printCyan "Icons copied to ${ICONS_FILES_PATH}..."
fi

if [[ ${setIcons} == "1" ]]; then
  gsettings set org.gnome.desktop.interface icon-theme "OmTheme"
  printCyan "\nIcons OmTheme is activated..."
fi

if [[ ${setIcons} == "1" || ${setTheme} == "1" ]]; then
  dbus-send --type=method_call --print-reply --dest=org.gnome.Shell /org/gnome/Shell org.gnome.Shell.Eval string:'global.reexec_self()';
  printCyan "\nGnome-shell restarted..."
fi

