# antigen
source $HOME/.dotfiles/antigen/antigen.zsh

# Load various lib files
antigen use oh-my-zsh

# Bundles from the default repo (robbyrussell's oh-my-zsh).
antigen bundle git
antigen bundle command-not-found

# Bundles from external sources
antigen bundle zsh-users/zsh-syntax-highlighting
antigen bundle zsh-users/zsh-autosuggestions
antigen bundle lukechilds/zsh-better-npm-completion

# theme
# antigen theme robbyrussell
antigen theme pure

# Tell antigen that you're done.
antigen apply

# customizations

# path
export PATH=$HOME/bin:$HOME/bin/SuperCollider:/usr/local/bin:/usr/local/opt/ruby/bin:$HOME/Library/Haskell/bin:$HOME/.local/bin:$HOME/.cabal/bin:$HOME/src/music-suite/music-sandbox/bin:$PATH

# set the default system editor
export VISUAL=nvim
export EDITOR="$VISUAL"
export GIT_EDITOR="$VISUAL"

export LC_ALL=en_US.UTF-8

# zsh
bindkey '^R' history-incremental-search-backward

# aliases
alias tmux='tmux -2' # force tmux to assume 256color terminal
alias vim=nvim

# # ls
# alias ll='ls -alF'
# alias la='ls -A'
# alias l='ls -oF'
# alias cp='cp -v'

# misc
# alias ..='cd ..'

# Setup fuzzy bookmark search function
# ------------------------------------
unalias c 2> /dev/null
c() {
   local dest_dir=$(bookmarks_glob_echo | fzf)
   if [[ $dest_dir != '' ]]; then
      cd "$dest_dir"
   fi
}
export -f c > /dev/null

# add bookmark entry
unalias bkm 2> /dev/null
bkm() {
    bookmark_pwd
    echo "Added bookmark:" `pwd`
}
export -f bkm > /dev/null

# search for word with ag and open file in vim
unalias sf 2> /dev/null
sf() {
    ag "$1" --ignore "$2" | fzf --ansi | awk '{print $1}' | xargs nvim
}

export -f sf > /dev/null

# fzf
export FZF_DEFAULT_COMMAND='ag -g ""'
# To apply the command to CTRL-T as well
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"


[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
