set fish_greeting

# Starship prompt
if status --is-interactive
   source ("starship" init fish --print-full-init | psub)
end

# Custom aliases
alias vim="nvim"
alias ls="eza -la"
alias code="code --enable-features=UseOzonePlatform --ozone-platform=wayland"
# Devcontainer aliases
alias devcb="devcontainer build --workspace-folder ."
alias devcu="devcontainer up --workspace-folder ."
alias devce="devcontainer exec --workspace-folder ."
alias dtmux="devcontainer exec --workspace-folder . tmux"
