HISTSIZE=10000
HISTFILESIZE=2000

BASE16_SHELL=$HOME/.config/base16-shell/
[ -n "$PS1" ] && [ -s $BASE16_SHELL/profile_helper.sh ] && eval "$($BASE16_SHELL/profile_helper.sh)"

export PAGER='less -R'
export TERMINAL='urxvt'

alias ls='ls --color'
alias open=xdg-open

# Load Xresouces
[[ -f ~/.Xresources ]] && xrdb -merge -I$HOME ~/.Xresources

# Enable auto completion
if [ -f /etc/bash_completion ] && ! shopt -oq posix; then
    . /etc/bash_completion
fi

# Load fzf config
[ -f ~/.fzf.bash ] && source ~/.fzf.bash
