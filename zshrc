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

# set path
path=($HOME/Library/Haskell/bin $path)
path=($HOME/bin/SuperCollider $path)
path=(/usr/local/opt/ruby/bin $path)
path=($HOME/.cabal/bin $path)
path=($HOME/.local/bin $path)
path=($HOME/bin $path)
path=($HOME/bin/bin $path)
path=("/usr/local/sbin" $path)
path=("/usr/local/bin" $path)

# typeset -U path

export XML_CATALOG_FILES=/usr/local/etc/xml/catalog
export GOPATH=$HOME/.go
# use this to get sysroot path
# $(rustc --print sysroot)
export RUST_SRC_PATH="$HOME/.rustup/toolchains/stable-x86_64-apple-darwin/lib/rustlib/src/rust/src"
# tmuxp completion
eval "$(_TMUXP_COMPLETE=source tmuxp)"

# set the default system editor
export VISUAL=nvim
export EDITOR="$VISUAL"
export GIT_EDITOR="$VISUAL"
export MANPAGER="nvim -u ~/.vim/vimrc0 -c 'set ft=man' -"

export LC_ALL=en_US.UTF-8

# aliases
alias tmux='tmux -2' # force tmux to assume 256color terminal
alias vim=nvim
alias v='nvim -u ~/.vim/vimrc0'
alias tidalvim='cd ~/code/haskell/tidal && tidalvim'

# browse bookmars
function c() {
    local dest_dir=$(bookmarks_glob_echo | fzf)
    if [[ $dest_dir != '' ]]; then
        cd "$dest_dir"
    fi
}

# add bookmark
function bkm() {
    pwd >> ~/.shell_bookmarks
    echo "Added bookmark:" `pwd`
}

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
