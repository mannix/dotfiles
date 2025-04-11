#!/bin/bash

# Create .vim directories
mkdir -pv $HOME/.vim/{backup,colors,swap,undo}

# Copy colorschemes
cp -r colors/*.vim ~/.vim/colors

echo "Done."
