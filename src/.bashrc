# Dan's generic .bashrc
#

if [ -f /etc/bashrc ]; then
    . /etc/bashrc
fi

# A custom file for including stuff I don't want to commit to dotfiles
if [ -f ~/.bash_extras ]; then
    . ~/.bash_extras
fi

if [ -f ~/.git-completion.bash ]; then
    . ~/.git-completion.bash
fi

# Environment Variables
#

export INPUTRC=~/.inputrc
export EDITOR=vim
export PROMPT_COMMAND=""
export PS1="\[\e[1;36m\]\u\[\e[0m\]@\[\e[1;32m\]\h\[\e[0m\]:\[\e[1;34m\]\w\[\e[0m\]\$ "
export GOPATH="$HOME/go"
export PATH=$PATH:$GOPATH/bin

alias ls="ls -h"
alias ll="ls -al"
alias st="svn st -q"
alias du="du -h"
alias df="df -h"
alias bc="bc -l"
alias grep="grep --color=auto"
alias egrep="egrep --color=auto"
alias fgrep="fgrep --color=auto"

set -o vi

# Nifty functions
#

# Grab column N from stdin, ex. `ps aux | cl 2` => Just Process IDs
function cl() {
    awk "{print \$$1}"
}

function psx () {
    if [ -n "$1" ]; then
        ps aux | grep -v "grep" | grep -i "$1"
    else
        ps aux
    fi
}

PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting
