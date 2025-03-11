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

# ASDF configuration code
if test -z $ASDF_DATA_DIR
    set _asdf_shims "$HOME/.asdf/shims"
else
    set _asdf_shims "$ASDF_DATA_DIR/shims"
end

# Do not use fish_add_path (added in Fish 3.2) because it
# potentially changes the order of items in PATH
if not contains $_asdf_shims $PATH
    set -gx --prepend PATH $_asdf_shims
end
set --erase _asdf_shims
