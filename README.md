# dotfiles

Config files for zsh, bash, tmux etc.

## zsh

### Plugins

Plugins are handled by the [antibody](https://github.com/getantibody/antibody) plugin manager. The script `generate-sources.sh` will install and generate (static) paths to the plugin sources, this improves shell startup time significantly.

### Shell bookmarks

I have three commands which provides easier navigation in the shell. The first two `c` and `bkm`, browses and adds to static "bookmark list" respectively. The actual commands that are used can be be found in the `bin` directory of this repo, [fzf](https://github.com/junegunn/fzf) is used for filtering the list.

The `r` command makes use of the [z](https://github.com/rupa/z) plugin to generate a list of the most frequently used directories, which is then sorted and piped to `fzf`.

`c` - Browse static list of shell bookmarks

`bkm` - Add current `pwd` to bookmarks list

`r` - Browse "most recent" directories

# Tools

## Shell

```
zsh
tmux
antibody
```

## Command line

### Core

```
git
cmake
neovim
fzf
jq
pandoc
sox
ripgrep
fd
tree
htop
```

### Language

```
python
python@2
rbenv
```

### Misc

```
youtube-dl
shellcheck
```

## npm

```
npm install -g backslide
```
