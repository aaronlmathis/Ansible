#!/bin/sh
echo "Written by Renato R R Araujo <renatorraraujo@gmail.com>"
echo "License Warning
This program is free software: you can redistribute it and/or modify it under the terms of the GNU General Public License as published by the Free Software Foundation, either version 3 of the License, or (at your option) any later version.

This program is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU General Public License for more details.

You should have received a copy of the GNU General Public License along with this program. If not, see <https://www.gnu.org/licenses/>.
"
echo "Press any key if you read and agree with these terms, or press Ctrl+C anytime to cancel"
read && \
clear && \
# Checking for wget
wget --version 1> /dev/null
if [ $? -ne 0 ]
then
    echo "Wget is missing. Press any key to install it automatically..."
    read && \
    sudo apt install wget || 
    sudo pacman -S wget || 
    sudo dnf install wget || 
    echo "Sorry, it was not possible to install wget automatically"
else
    echo "Wget detected"
fi
# Checking for zshell
zsh --version 1> /dev/null
if [ $? -ne 0 ]
then
    echo "Zsh is missing. Press any key to install it automatically..." 
    read && \
    sudo apt install -y zsh || 
    sudo pacman -S zsh --noconfirm || 
    sudo dnf -y install zsh || 
    echo "Sorry, it was not possible to install zsh automatically"
else
    echo "Zsh detected"
fi
# Download and install .zsh theme
echo "Getting into Home directory..." && \
cd && \
echo "Backing up any previous .zsh file" && \
mv .zshrc .zshrc.backup -v 2> /dev/null && \
echo "Downloading theme..." && \
echo "Warning: I am not responsible for the source that is being downloaded next. You are responsible for its risks." && \
    echo "Press any key to agree and continue" && \
    read && \
wget \
    https://gist.githubusercontent.com/Anon-Exploiter/4e12193df0099183d18720c6471d571a/raw/5ffe8b5f2f20baf60a92b80283d4adf0d4c3ae20/.zshrc \
    && \
echo "Theme installed successfully!" &&\
echo "Press any key to start zsh!" &&\
read && \
zsh