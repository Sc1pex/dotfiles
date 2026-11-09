set fish_greeting

alias vim="nvim"
alias ls="eza -la"
alias cmd="cmake --preset debug"
alias cmr="cmake --preset release"
alias cbd="cmake --build --preset debug"
alias cbr="cmake --build --preset release"
alias ctd="ctest --preset debug"
alias ctr="ctest --preset release"
alias dot="git --git-dir=$HOME/.dotfiles --work-tree=$HOME"

set -gx EDITOR nvim

starship init fish | source

set -gx VCPKG_ROOT ~/dev/gitClones/vcpkg

# homebrew libraries for compilers and linkers
set -gx CPATH /home/linuxbrew/.linuxbrew/include
set -gx LIBRARY_PATH /home/linuxbrew/.linuxbrew/lib
set -gx LDFLAGS -Wl,-rpath,/home/linuxbrew/.linuxbrew/lib

# >>> scala-cli completions >>>
complete scala-cli -a '(scala-cli complete fish-v1 (math 1 + (count (__fish_print_cmd_args))) (__fish_print_cmd_args))'
# <<< scala-cli completions <<<

# java
set -gx JAVA_HOME ~/.jdks/corretto-23.0.2/
set -gx PATH $JAVA_HOME/bin $PATH

# ZVM
set -gx ZVM_INSTALL $HOME/.zvm/self
set -gx PATH $HOME/.zvm/bin $PATH 
set -gx PATH $ZVM_INSTALL/ $PATH


# Added by Antigravity CLI installer
set -gx PATH "/home/scipex/.local/bin" $PATH
