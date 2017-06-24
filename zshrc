source <(antibody init)
source ~/.dotfiles/sourceables.sh
source ~/.dotfiles/aliases.sh
source ~/.dotfiles/completion.zsh


export HISTSIZE=1000
export SAVEHIST=1000
export HISTFILE=~/.zsh_history
# edit commands in vim
autoload -z edit-command-line
zle -N edit-command-line
bindkey -M vicmd v edit-command-line

setopt share_history # share command history data
setopt hist_ignore_dups

# path
export PATH=$HOME/bin:$HOME/bin/SuperCollider:/usr/local/bin:/usr/local/opt/ruby/bin:$HOME/Library/Haskell/bin:$HOME/.local/bin:$HOME/.cabal/bin:$PATH

# set the default system editor
export VISUAL=nvim
export EDITOR="$VISUAL"
export GIT_EDITOR="$VISUAL"
export MANPAGER="nvim -u ~/.vim/vimrc0 -c 'set ft=man' -"

export LC_ALL=en_US.UTF-8

# aliases
alias tmux='tmux -2' # force tmux to assume 256color terminal
alias vim=nvim
alias tidalvim='cd ~/code/haskell/tidal && tidalvim'

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

# start gpg-agent
[ -f ~/.gpg-agent-info ] && source ~/.gpg-agent-info
if [ -S "${GPG_AGENT_INFO%%:*}" ]; then
  export GPG_AGENT_INFO
else
  eval "$(gpg-agent --daemon --write-env-file ~/.gpg-agent-info)"
fi

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
