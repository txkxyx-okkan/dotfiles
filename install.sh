#!/bin/bash

# dotfiles directory
DOTFILES_DIR=$(cd "$(dirname "$0")" && pwd)

# List of files to be placed in the home directory
FILES=(
  .zshrc
)

# List of directories to be placed in the home directory
DIRECTORIES=(
  .config/wezterm
)

# Function to create a symbolic link
create_symlink() {
  local src=$1
  local dest=$2

  # Check if the destination is an existing file or symbolic link
  if [ -L "$dest" ]; then
    echo "既存のシンボリックリンクが見つかりました: $dest"
    return
  elif [ -e "$dest" ]; then
    echo "既存のファイルまたはディレクトリが見つかりました: $dest"
    echo "バックアップを作成します: $dest.bak"
    mv "$dest" "${dest}.bak"
  fi

  # Create symbolic link
  ln -s "$src" "$dest"
  echo "シンボリックリンクを作成しました: $src -> $dest"
}

# Main process

# Install Homebrew
chmod +x "$DOTFILES_DIR/install/install_homebrew.sh"
"$DOTFILES_DIR/install/install_homebrew.sh"

# Create symbolic links for files
echo "シンボリックリンクの作成を開始します..."
for file in "${FILES[@]}"; do
  src="$DOTFILES_DIR/$file"
  dest="$HOME/$file"

  if [ -f "$src" ]; then
    create_symlink "$src" "$dest"
  else
    echo "ファイルが見つかりません: $src"
  fi
done

# Create symbolic links for directories
for dir in "${DIRECTORIES[@]}"; do
  src="$DOTFILES_DIR/$dir"
  dest="$HOME/$dir"

  if [ -d "$src" ]; then
    if [ ! -L "$dest" ]; then  # 既存のシンボリックリンクがないか確認
      if [ -d "$dest" ]; then
        echo "既存のディレクトリが見つかりました: $dest"
        echo "バックアップを作成します: $dest.bak"
        mv "$dest" "${dest}.bak"
      fi
      create_symlink "$src" "$dest"
    else
      echo "シンボリックリンクが既に存在するためスキップします: $dest"
    fi
  else
    echo "ディレクトリが見つかりません: $src"
  fi
done

# Install Oh My Zsh
chmod +x "$DOTFILES_DIR/install/install_ohmyzsh.sh"
"$DOTFILES_DIR/install/install_ohmyzsh.sh"

# Install zsh-autocomplete
chmod +x "$DOTFILES_DIR/install/install_zsh_autocomplete.sh"
"$DOTFILES_DIR/install/install_zsh_autocomplete.sh"

# Install zsh-autosuggestions
chmod +x "$DOTFILES_DIR/install/install_zsh_autosuggestions.sh"
"$DOTFILES_DIR/install/install_zsh_autosuggestions.sh"

echo "インストールが完了しました！"
