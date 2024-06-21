#!/bin/bash

RED='\033[0;31m'
echo -e "${RED} This script runs 'sudo pacman -Syu && paru -Syu --devel'. To confirm, enter your password"


sudo pacman -Syu && paru -Syu --devel
