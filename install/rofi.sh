#!/usr/bin/env bash

DOTFILES=$HOME/.dotfiles

# env git clone https://github.com/DaveDavenport/rofi-themes.git "$DOTFILES/config/rofi/themes" || {
#     printf "Error: git clone of rofi themes repo failed\n"
# }

# xdg=${HOME}/.local/share
# DIRECTORY="${xdg}/rofi/themes/}"

# if [ ! -d "${DIRECTORY}" ]
# then
#     echo "Creating theme directory: ${DIRECTORY}"
#     mkdir -p "${DIRECTORY}"
# fi

# declare -i ia=0
# for themefile in $DOTFILES/config/rofi/themes/**/*.rasi
# do
#     if [ -f "${themefile}" ] && [ ${ia} -eq 0 ]
#     then
#         echo "Theme '${themefile}' exists, overwrite? y/N/a(ll)"
#         read answer
#         if [ x$answer = x"y" ]
#         then
#             echo "+Installing '${themefile}'"
#             install "${themefile}" "${DIRECTORY}"
#         elif [ x${answer} = x"a" ]
#         then
#             ia=1
#             echo "+Installing '${themefile}'"
#             install "${themefile}" "${DIRECTORY}"
#         else
#             echo "+Skipping ${themefile}"
#         fi
#     else
#             echo "+Installing '${themefile}'"
#             install "${themefile}" "${DIRECTORY}"
#     fi
# done

mkdir -p ~/.config/rofi
ln -s ~/.dotfiles/config/rofi/config.rasi ~/.config/rofi/config.rasi
ln -s ~/.dotfiles/config/rofi/config ~/.config/rofi/config
