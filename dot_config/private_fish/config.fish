# Alias
alias l="ls"
alias v="nvim"
alias t="tmux"
alias ta="tmux attach"

alias c="claude"
alias cc="claude --continue"
alias cc="claude --resume"

# Modify path to have local binaries
set -gx PATH $HOME/.local/bin $PATH

fish_vi_key_bindings
if status is-interactive
# Commands to run in interactive sessions can go here
end
