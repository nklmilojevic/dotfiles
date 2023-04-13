#!/bin/bash
rm -rf /tmp/astronvim

git clone --depth 1 https://github.com/AstroNvim/AstroNvim /tmp/astronvim

mkdir $HOME/.config/nvim

mv /tmp/astronvim/* $HOME/.config/nvim

echo "~ astronvim has been installed"