#!/bin/bash

if [ "$(uname)" == "Darwin" ]; then
    # mac
    export OS=Darwin
elif [ -n "$(cat /etc/os-release | grep Ubuntu)" ]; then
    # ubuntu
    export OS=Ubuntu
elif [ -f "/etc/arch-release" ]; then
    # arch
    export OS=Arch
elif [ -f "/etc/artix-release" ]; then
    # arch
    export OS=Arch
elif [ -f "/etc/fedora-release" ]; then
    # fedora
    export OS=Fedora
elif [ "$(expr substr $(uname -s) 1 10)" == "MINGW64_NT" ]; then
    # echo "Windows not currently supported"
    export OS=Windows
fi
