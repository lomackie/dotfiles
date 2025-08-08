# Global settings
set -gx EDITOR nvim

if test (uname) = "Darwin"
    set -gx PATH /opt/homebrew/bin /opt/homebrew/opt/make/libexec/gnubin $PATH
else if test (uname) = "Linux"
    set -gx PATH /opt/nvim-linux-x86_64/bin $PATH
end

# Common path
set -gx PATH $HOME/go/bin $PATH

starship init fish | source

source $HOME/.config/fish/conf.d/abbr.fish

# Generated for envman. Do not edit.
test -s ~/.config/envman/load.fish; and source ~/.config/envman/load.fish
