#!/bin/bash

CYAN='\033[96m'
RESET='\033[0m'
echo -e "${CYAN} This script runs 'sudo pacman -Syu && paru -Syu --devel'. To confirm, enter your password"$RESET


sudo pacman -Syu && paru -Syu --devel
