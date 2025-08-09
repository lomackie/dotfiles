# Global settings
set -gx EDITOR nvim

if test (uname) = "Darwin"
    set -gx PATH /opt/homebrew/bin /opt/homebrew/opt/make/libexec/gnubin $PATH
else if test (uname) = "Linux"
    set -gx PATH /opt/nvim-linux-x86_64/bin /usr/local/go/bin $HOME/.local/bin $PATH
    set -gx GOPATH $HOME/go
end

# Common path
set -gx PATH $HOME/go/bin $PATH

set -gx KUBECONFIG $HOME/.kube/config

starship init fish | source

source $HOME/.config/fish/conf.d/abbr.fish

# Generated for envman. Do not edit.
test -s ~/.config/envman/load.fish; and source ~/.config/envman/load.fish

zoxide init fish | source
