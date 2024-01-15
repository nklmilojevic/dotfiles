#!/bin/bash
rm -rf $HOME/astronvim

git clone --depth 1 https://github.com/AstroNvim/AstroNvim $HOME/astronvim

mkdir $HOME/.config/nvim

mv $HOME/astronvim/{.,}* $HOME/.config/nvim

echo "~ astronvim has been installed"