# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
setopt appendhistory autocd notify
bindkey -v
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '/home/britovi/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall

autoload -U promptinit
promptinit

autoload -U colors && colors

# Autoload zsh functions.
fpath=(~/.zsh/functions $fpath)
autoload -U ~/.zsh/functions/*(:t)

# Enable auto-execution of functions.
typeset -ga preexec_functions
typeset -ga precmd_functions
typeset -ga chpwd_functions

# Append git functions needed for prompt.
preexec_functions+='preexec_update_git_vars'
precmd_functions+='precmd_update_git_vars'
chpwd_functions+='chpwd_update_git_vars'

PROMPT="%{$fg[blue]%}%n%{$fg[yellow]%}@%{$fg[red]%}%m: %{$fg[yellow]%}%c%{$reset_color%}$(prompt_git_info)%{$reset_color%} %% "

# helper method
has_executable() {
    TMP=`which $1 2> /dev/null` 
    [ $? -eq 0 ]
}

has_executable "fortune" && has_executable "cowsay" && fortune | cowsay

bindkey -s '^Y' '^qsudo pacman -Syu\n'
bindkey -s '^P' '^qsudo poweroff\n'
bindkey -s '^T' '^qsudo reboot\n'

[[ -z $DISPLAY && $XDG_VTNR -eq 1 ]] && exec startxfce4

export PATH="$PATH:$HOME/.rvm/bin" # Add RVM to PATH for scripting

