#!/bin/bash

sudo pacman -Syu

git clone https://aur.archlinux.org/paru-bin.git
cd paru-bin
makepkg -si
cd

paru -S zramd lf ly
