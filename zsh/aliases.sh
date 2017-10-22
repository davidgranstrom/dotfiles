alias ..='cd ..'

alias ls='ls -G'                              # enable color output
alias l='ls -1F'                              # one column, show type
alias la='ls -laFh'                           # long list, show almost all, show type, human readable
alias lt='ls -laFht'                          # long list, sorted by date, show type, human readable
alias li='ls | fzf --preview="head -n 20 {}"' # list and preview

alias rm='rm -i'
alias cp='cp -i'
alias mv='mv -i'

alias tmux='tmux -2' # force tmux to assume 256color terminal
alias vim=nvim
alias v='nvim -u ~/.vim/vimrc0'
alias tidalvim='cd ~/code/haskell/tidal && tidalvim'
alias t='task'