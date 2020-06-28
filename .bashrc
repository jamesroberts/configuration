export PS1="\[\e[32m\]James\[\e[m\]:\[\e[34m\]\w\[\e[m\] \[\e[32m\]\\$\[\e[m\] "
LS_COLORS=$LS_COLORS:'di=1;34;40:ln=36;40:so=32:pi=33:ex=1;35:bd=0;40:cd=0;40:su=0;40:sg=0;40:tw=34;40:ow=34;40'; 
export LS_COLORS;

# Aliases
alias ls='ls -la --color'
alias c='cd /mnt/c/'
alias d='cd /mnt/d/'
alias dev='cd /mnt/d/dev/'

# Git shortcuts
alias gs='git status'
alias gf='git fetch'
alias rebase='git pull --rebase'

# Programming Languages
alias python='python3'
alias pip='pip3'
