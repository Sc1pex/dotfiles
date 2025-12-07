set fish_greeting

alias vim="nvim"
alias ls="eza -la"

set -gx EDITOR nvim

starship init fish | source

set -gx VCPKG_ROOT ~/dev/gitClones/vcpkg

# >>> scala-cli completions >>>
complete scala-cli -a '(scala-cli complete fish-v1 (math 1 + (count (__fish_print_cmd_args))) (__fish_print_cmd_args))'
# <<< scala-cli completions <<<

# java
set -gx JAVA_HOME ~/.jdks/openjdk-25.0.1/
set -gx PATH $JAVA_HOME/bin $PATH

# ZVM
set -gx ZVM_INSTALL $HOME/.zvm/self
set -gx PATH $HOME/.zvm/bin $PATH 
set -gx PATH $ZVM_INSTALL/ $PATH
