# Global settings
set -gx EDITOR nvim
set -gx PATH /opt/homebrew/bin /opt/homebrew/opt/make/libexec/gnubin $HOME/go/bin $PATH
starship init fish | source

source $HOME/.config/fish/conf.d/abbr.fish

# Generated for envman. Do not edit.
test -s ~/.config/envman/load.fish; and source ~/.config/envman/load.fish
