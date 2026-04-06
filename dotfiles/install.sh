#!/bin/zsh

# ============================================================
#  Dotfiles installer
#  Defines and creates symlinks for all dotfiles.
#  Usage: zsh install.sh
# ============================================================

DOTFILES_DIR="$(cd "$(dirname "$0")" && pwd)"

# Define symlinks as "source_filename:target_path[:source_in_zshrc]"
# Add a third field "source" to also add a source line to ~/.zshrc
symlinks=(
    ".zshivalry.zsh:$HOME/.zshivalry.zsh:source"
    "lazygit.yml:$HOME/.config/lazygit/config.yml"
    "config.ghostty:$HOME/.config/ghostty/config.ghostty"
)

for entry in $symlinks; do
    fields=("${(@s/:/)entry}")
    src="$DOTFILES_DIR/${fields[1]}"
    dst="${fields[2]}"

    mkdir -p "$(dirname "$dst")"
    ln -sf "$src" "$dst"
    echo "Linked $src -> $dst"

    if [[ "$entry" == *":source" ]]; then
        zshrc="$HOME/.zshrc"
        source_line="source ${dst/$HOME/~}"
        if ! grep -qF "$source_line" "$zshrc"; then
            echo "\n$source_line" >> "$zshrc"
            echo "Added '$source_line' to $zshrc"
        else
            echo "Already in $zshrc, skipping: $source_line"
        fi
    fi
done

if [[ "$(uname)" == "Darwin" ]]; then
    if ! command -v brew &>/dev/null; then
        echo "\nInstalling Homebrew..."
        /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
    fi
    echo "\nInstalling Homebrew packages..."
    brew bundle --file="$DOTFILES_DIR/Brewfile"
fi

echo "\nDone! Run 'source ~/.zshrc' to apply changes to your current session."
