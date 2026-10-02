#!/bin/bash

# This script will create symlink for all the folder in this repository into their required location.

# For more clarity, please clone this repository in ~/.config/
CURRENT_DIR=$(pwd)

ln -s "$CURRENT_DIR"/quickshell/ "$HOME/.config/quickshell"
ln -s "$CURRENT_DIR"/hypr/ "$HOME/.config/hypr"
ln -s "$CURRENT_DIR"/kitty/ "$HOME/.config/kitty"
ln -s "$CURRENT_DIR"/theme_Yorha/ "$HOME/.local/share/Yorha"
ln -s "$CURRENT_DIR"/.clang-format "$HOME/.clang-format"
ln -s "$CURRENT_DIR"/tmux.conf "$HOME/.tmux.conf"
