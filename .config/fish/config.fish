set fish_greeting

# Starship prompt
if status --is-interactive
   source ("starship" init fish --print-full-init | psub)
end

# Custom aliases
alias vim="nvim"
alias ls="eza -la"
alias code="code --enable-features=UseOzonePlatform --ozone-platform=wayland"

set -gx EDITOR nvim

function tses
    set selected_sesh (sesh list -i -T | gum filter --limit 1 --placeholder 'Pick a sesh' --prompt='⚡')
    sesh connect "$selected_sesh"
end

