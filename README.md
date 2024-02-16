# My aliases for bash/zsh shell
This repo contains the list of useful aliases for:
- general terminal activities
- git
- python development
- django development
- other

## You can add them by running `load_aliases.sh`

## Alternatively follow these steps:
- copy `.myaliases` to your home directory
- add ref to the file in your shell dotfile (eg. `.bashrc` or `.zshrc`):
  ```
  if test -f "$HOME/.myaliases"; then
    source $HOME/.myaliases
  fi
  ```
- restart your shell to load changes
