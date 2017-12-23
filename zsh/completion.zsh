# On slow systems, checking the cached .zcompdump file to see if it must be
# regenerated adds a noticable delay to zsh startup.  This little hack restricts
# it to once a day.  It should be pasted into your own completion file.
#
# The globbing is a little complicated here:
# - '#q' is an explicit glob qualifier that makes globbing work within zsh's [[ ]] construct.
# - 'N' makes the glob pattern evaluate to nothing when it doesn't match (rather than throw a globbing error)
# - '.' matches "regular files"
# - 'mh+24' matches files (or directories or whatever) that are older than 24 hours.

autoload -Uz compinit

re_initialize=0
zcompdump=$HOME/.zcompdump

for match in "$zcompdump"*(.Nmh+24); do
  re_initialize=1
  break
done

if [[ "$re_initialize" -eq "1" ]]; then
  compinit
  # update the timestamp on compdump file
  compdump
else
  # omit the check for new functions since we updated today
  compinit -C
fi

# Do menu-driven completion.
zstyle ':completion:*' menu select

bindkey '^j' autosuggest-accept

# Color completion for some things.
# http://linuxshellaccount.blogspot.com/2008/12/color-completion-using-zsh-modules-on.html
# zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}

# source ~/.local/bin/aws_zsh_completer.sh
# tmuxp completion
# eval "$(_TMUXP_COMPLETE=source tmuxp)"
