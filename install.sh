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
PURPLE='\033[0;35m'
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

function printPurple() {
  printf "${PURPLE}$1${NC}\n"
}

function separator() {
  echo '🔸🔸🔸🔸🔸🔸🔸🔸🔸🔸🔸🔸🔸🔸🔸🔸🔸🔸🔸🔸🔸🔸🔸'
}

printf '\n\n'
separator

printCyan "\n🔵 Please, answer some questions with numbers, 1, 2, 3... and so on!"
printCyan "🔵 That way you're going to know exactly what I'm going to do...\n"

separator

installTheme=""
while [[ $installTheme != "1" && $installTheme != "2" ]]; do
  if [[ ${installTheme} != "" ]]; then
    printRed "\n🔴 Please, use the numbers to answer!\n"
    printCyan "🔵 Let me ask you again..."
  fi
  
  printYellow "\n🟡 Do you want to install OmTheme?\n"
  printGreen "🟢 1) Yes"
  printGreen "🔴 2) No"
  read -p "Your turn [1, 2]: " installTheme
done;

if [[ ${installTheme} != "1" ]]; then
  printCyan "\n🔵 Ok, I won't!"
  printCyan "🔵 BYEE!"
  exit
else
  printCyan "\n🔵 Ok, I have some more questions..."
  printCyan "🔵 Don't worry, it'll be super fast =)"
fi

printf '\n\n'
separator

copyFiles=""
while [[ $copyFiles != "1" && $copyFiles != "2" ]]; do
  if [[ ${copyFiles} != "" ]]; then
    printRed "\n🔴 Please, use the numbers to answer!\n"
    printCyan "🔵 Let me ask you again..."
  fi
  
  printYellow "\n🟡 I'm going to copy the files to \"${THEME_FILES_PATH}\"."
  printYellow "🟡 Is that ok?\n"
  printGreen "🟢 1) Yes"
  printGreen "🔴 2) No"
  read -p "Your turn [1, 2]: " copyFiles
done;

if [[ ${copyFiles} != "1" ]]; then
  printCyan "\n🔵 Ok, I won't!"
  printRed "🔴 Unfortunately, I was going to need those files to enable the theme!"
  printRed "🔴 BYEE!"
  exit
else
  printCyan "\n🔵 Ok, I will copy the files in a moment..."
fi

printf '\n'
separator


iconsTheme=""
while [[ $iconsTheme != "1" && $iconsTheme != "2" ]]; do
  if [[ ${iconsTheme} != "" ]]; then
    printRed "\n🔴 Please, use the numbers to answer!\n"
    printCyan "🔵 Let me ask you again..."
  fi
  
  printYellow "\n🟡 Do you want me to copy icon files to \"${ICONS_FILES_PATH}\"."
  printCyan "🔵 The icons are not required, but they are nice!\n"
  printGreen "🟢 1) Yes"
  printGreen "🔴 2) No"
  read -p "Your turn [1, 2]: " iconsTheme
done;

if [[ ${iconsTheme} != "1" ]]; then
  printCyan "\n🔵 Ok, I won't!"
else
  printCyan "\n🔵 Ok, I'll copy the icons as soon as we're done here..."
fi

printf '\n'
separator

setTheme=""
while [[ $setTheme != "1" && $setTheme != "2" ]]; do
  if [[ ${setTheme} != "" ]]; then
    printRed "\n🔴 Please, use the numbers to answer!\n"
    printCyan "🔵 Let me ask you again..."
  fi
  
  printYellow "\n🟡 Do you want me to apply the theme when I'm done?"
  printGreen "🟢 1) Yes"
  printGreen "🔴 2) No"
  read -p "Your turn [1, 2]: " setTheme
done;

if [[ ${setTheme} != "1" ]]; then
  printCyan "\n🔵 Ok, I won't!"
else
  printCyan "\n🔵 Ok, I'll set the theme for you..."
fi

printf '\n'
separator

setIcons=""
while [[ $iconsTheme == "1" && $setIcons != "1" && $setIcons != "2" ]]; do
  if [[ ${setIcons} != "" ]]; then
    printRed "\n🔴 Please, use the numbers to answer!\n"
    printCyan "🔵 Let me ask you again..."
  fi
  
  printYellow "\n🟡 Do you want me to apply the icons theme when I'm done?"
  printGreen "🟢 1) Yes"
  printGreen "🔴 2) No"
  read -p "Your turn [1, 2]: " setIcons
done;

if [[ ${setIcons} != "1" ]]; then
  printCyan "\n🔵 Ok, I won't!"
else
  printCyan "\n🔵 Ok, I'll set the icons for you..."
fi

printf '\n'
separator

confirmation=""
while [[ $confirmation != "1" && $confirmation != "2" ]]; do
  if [[ ${confirmation} != "" ]]; then
    printRed "\n🔴 Please, use the numbers to answer!\n"
    printCyan "🔵 Let me ask you again..."
  fi
  
  printYellow "\n🟡 Please, confirm your answers?\n"

  if [[ ${installTheme} == "1" ]]; then
    printCyan "🔵 You want me to install OmTheme"
  fi
  
  if [[ ${copyFiles} == "1" ]]; then
    printCyan "🔵 You want me to copy the theme files to ${THEME_FILES_PATH}"
  else
    printRed "🔴 You DON'T want me to copy the theme files to ${THEME_FILES_PATH}"
  fi

  if [[ ${iconsTheme} == "1" ]]; then
    printCyan "🔵 You want me to copy the icon files to ${ICONS_FILES_PATH}"
  else
    printRed "🔴 You DON'T want me to copy the icons files to ${ICONS_FILES_PATH}"
  fi

  if [[ ${setTheme} == "1" ]]; then
    printCyan "🔵 You want me to set the theme for you"
  else
    printRed "🔴 You DON'T want me to set the theme for you"
  fi

  if [[ ${setIcons} == "1" ]]; then
    printCyan "🔵 You want me to set the icons theme for you"
  else
    printRed "🔴 You DON'T want me to set the icons theme for you"
  fi

  printGreen "\n🟢 1) Yes"
  printGreen "🔴 2) No"
  read -p "Your turn [1, 2]: " confirmation
done;

if [[ $confirmation != "1" ]]; then
  printCyan "\n🔵 Ok, you can restart the script and answer again..."
  exit
else
  printCyan "\n🔵 Ok, now I'm going to do my job..."
fi

printf '\n'
separator
printf '\n'

if [[ ${copyFiles} == "1" ]]; then
  if [[ ! -d "$THEME_FILES_PATH" ]]; then
    mkdir -p $THEME_FILES_PATH
  fi

  cp -R './OmTheme/.' "${THEME_FILES_PATH}"
  printCyan "\n🔵 Theme files copied to ${THEME_FILES_PATH}..."
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
  sudo -u ${RUID} DBUS_SESSION_BUS_ADDRESS="unix:path=/run/user/${RUSER_UID}/bus" gsettings set org.gnome.shell.extensions.user-theme name "OmTheme" 2> /dev/null
  
  dashToDock=""
  while [[ $dashToDock != "1" && $dashToDock != "2" ]]; do
    if [[ ${dashToDock} != "" ]]; then
      printRed "\n🔴 Please, use the numbers to answer!\n"
      printCyan "🔵 Let me ask you again..."
    fi
    
    printYellow "\n🟡 Do you want me to set dash-to-dock for you?"
    printGreen "🟢 1) Yes"
    printGreen "🔴 2) No"
    read -p "Your turn [1, 2]: " dashToDock
  done;

  if [[ ${dashToDock} != "1" ]]; then
    printCyan "\n🔵 Ok, I won't!"
  else
    printCyan "\nOk, it's moving down =)"
    sudo -u ${RUID} DBUS_SESSION_BUS_ADDRESS="unix:path=/run/user/${RUSER_UID}/bus" gsettings set org.gnome.shell.extensions.dash-to-dock apply-custom-theme true 2> /dev/null
    sudo -u ${RUID} DBUS_SESSION_BUS_ADDRESS="unix:path=/run/user/${RUSER_UID}/bus" gsettings set org.gnome.shell.extensions.dash-to-dock custom-theme-customize-running-dots true 2> /dev/null
    sudo -u ${RUID} DBUS_SESSION_BUS_ADDRESS="unix:path=/run/user/${RUSER_UID}/bus" gsettings set org.gnome.shell.extensions.dash-to-dock dock-position 'BOTTOM' 2> /dev/null
    sudo -u ${RUID} DBUS_SESSION_BUS_ADDRESS="unix:path=/run/user/${RUSER_UID}/bus" gsettings set org.gnome.shell.extensions.dash-to-dock extend-height false 2> /dev/null
  fi

  printCyan "\n🔵 Theme OmTheme is activated...\n"
fi

printf '\n'
separator
printf '\n'

if [[ ${iconsTheme} == "1" ]]; then
  if [[ ! -d "$ICONS_FILES_PATH" ]]; then
    mkdir -p $ICONS_FILES_PATH
  fi

  cp -R './yaru-blue-with-breeze/.' "${ICONS_FILES_PATH}"
  printCyan "🔵 Icons copied to ${ICONS_FILES_PATH}..."
fi

if [[ ${setIcons} == "1" ]]; then
  gsettings set org.gnome.desktop.interface icon-theme "OmTheme"
  printCyan "\n🔵 Icons OmTheme is activated...\n"
fi

if [[ ${setIcons} == "1" || ${setTheme} == "1" ]]; then
  restartGnome=""
  while [[ $restartGnome != "1" && $restartGnome != "2" ]]; do
    if [[ ${restartGnome} != "" ]]; then
      printRed "\n🔴 Please, use the numbers to answer!\n"
      printCyan "🔵 Let me ask you again..."
    fi
    
    printYellow "\n🟡 Sometimes GNOME won't apply themes without restarting,"
    printYellow "🟡 that can be achieved by pressing ALT + F2, typing r and ENTER."
    printYellow "🟡 Do you want me to do that for you?"
    printGreen "🟢 1) Yes"
    printGreen "🔴 2) No"
    read -p "Your turn [1, 2]: " restartGnome
  done;

  if [[ ${restartGnome} != "1" ]]; then
    printCyan "\n🔵 Ok, I won't!"
  else
    printCyan "\n🔵 Ok, restarting..."
    dbus-send --type=method_call --print-reply --dest=org.gnome.Shell /org/gnome/Shell org.gnome.Shell.Eval string:'global.reexec_self()';
    printCyan "\n🔵 Gnome-shell restarted..."
  fi
fi

printf '\n'
separator

printPurple "\n\n🟣 I believe everything was installed correctly, 🤩 ";
printPurple "🟣 but I recommend restarting you computer to be sure! 🥳";

printPurple "\n\n🟣 Thank you, BYE BYE!!! 👋";
printPurple "🟣 Author: Otávio Miranda\n\n";

