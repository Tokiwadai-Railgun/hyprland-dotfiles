#!/bin/bash

# This script will create symlink for all the folder in this repository into their required location.

# For more clarity, please clone this repository in ~/.config/
CURRENT_DIR=$(pwd)

ln -s "$CURRENT_DIR"/quickshell/ ~/.config/quickshell
ln -s "$CURRENT_DIR"/hypr/ ~/.config/hypr
ln -s "$CURRENT_DIR"/kitty/ ~/.config/kitty
