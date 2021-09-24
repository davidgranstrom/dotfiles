# dotfiles

Config files for zsh, bash, tmux etc.

## zsh

### Plugins

Plugins are handled by the [antibody](https://github.com/getantibody/antibody) plugin manager. The script `generate-sources.sh` will install and generate (static) paths to the plugin sources, this improves shell startup time significantly.

### Navigation

Some convenient shell navigation functions defined in `zsh/zshrc`.

[fzf](https://github.com/junegunn/fzf) is used for filtering for all three functions listed below and needs to be available in `$PATH`.

| Command  | Description                             |
|:--------:|:----------------------------------------|
| `c`      | Browse a static list of shell bookmarks |
| `bkm`    | Add current `pwd` to the bookmarks list |
| `r`      | Browse "most recent" directories        |

The `r` command makes use of the [z](https://github.com/rupa/z) plugin to generate a list of the most frequently used directories, which is then sorted and piped to `fzf`.

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
