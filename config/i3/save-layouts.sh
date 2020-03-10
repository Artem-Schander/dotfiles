#!/bin/sh

mkdir -p ~/.dotfiles/config/i3/layouts

i3-save-tree --workspace 1 > ~/.dotfiles/config/i3/layouts/workspace-1.json
i3-save-tree --workspace 2 > ~/.dotfiles/config/i3/layouts/workspace-2.json
i3-save-tree --workspace 3 > ~/.dotfiles/config/i3/layouts/workspace-3.json
i3-save-tree --workspace 4 > ~/.dotfiles/config/i3/layouts/workspace-4.json
# i3-save-tree --workspace 5 > ~/.dotfiles/config/i3/layouts/workspace-5.json
# i3-save-tree --workspace 6 > ~/.dotfiles/config/i3/layouts/workspace-6.json
i3-save-tree --workspace 7 > ~/.dotfiles/config/i3/layouts/workspace-7.json
i3-save-tree --workspace 8 > ~/.dotfiles/config/i3/layouts/workspace-8.json
# i3-save-tree --workspace 9 > ~/.dotfiles/config/i3/layouts/workspace-9.json
