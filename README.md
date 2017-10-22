# dotfiles

Config files for zsh, bash, tmux etc.

## zsh

### Plugins

Plugins are handled by the [antibody](https://github.com/getantibody/antibody) plugin manager. The script `generate-sources.sh` will install and generate (static) paths to the plugin sources, this improves shell startup time significantly.

### Shell bookmarks

I have three commands which provides easier navigation in the shell. The first two `c` and `bkm`, browses and adds to static "bookmark list" respectively. The actual commands that are used can be be found in the `bin` directory of this repo, [fzf](https://github.com/junegunn/fzf) is used for filtering the list.

The `rmu` command makes use of the [z](https://github.com/rupa/z) plugin to generate a list of the most frequently used directories, which is then sorted and piped to `fzf`.

`c` - Browse static list of shell bookmarks

`bkm` - Add current `pwd` to bookmarks list

`rmu` - Browse "most recent" directories using the `z` zsh-plugin
