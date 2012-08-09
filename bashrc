#
# BASHRC
# 
# ============================================================================
# GENERAL
# ============================================================================

# use vi keybindings in bash
set -o vi

# set the default system editor
export VISUAL=vim
export EDITOR=vim

# add shell scripts to $PATH
export PATH=$PATH:~/bin

# ============================================================================
# APPEARENCE
# ============================================================================

# ls
export LS_OPTIONS='--color=auto'
export CLICOLOR='Yes'
export LSCOLORS='Dxgxfxfxbxdxdxhbadbxbx'

# prompt
# export PS1="\[\033[01;38;5;39m\]\w > \[\033[0m\]"
export PS1="\[\033[01;38;5;37m\]\w > \[\033[0m\]"
# export PS1="\[\033[01;38;5;39m\]\u@\h|\[\033[0m\]\w > "

# ============================================================================
# EXAMPLES
# ============================================================================

# The ANSI sequence: {ESC}[{attr};{bg};{256colors};{fg}m
# example: \033[01;38;5;160m

# example prompt PS1="\[\033[1;34m\][\$(date +%H%M)][\u@\h:\w]$\[\033[0m\]"
