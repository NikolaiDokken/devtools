# Dotfiles

Personal configuration files.

## Setup

Run the install script to automatically symlink all dotfiles and add any necessary `source` lines to `~/.zshrc`:

```zsh
./install.sh
```

Then apply the changes to your current session:

```zsh
source ~/.zshrc
```

## Files

| File | Description | Installation / Usage |
|------|-------------|----------------------|
| `.zshivalry.zsh` | Medieval-themed aliases and functions for zsh (the Zshivalry project) | Add `source ~/path/to/dotfiles/.zshivalry.zsh` to your `~/.zshrc` |
