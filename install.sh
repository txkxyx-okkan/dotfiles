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

  # Check for existing files or symbolic links
  if [ -e "$dest" ] || [ -L "$dest" ]; then
    echo "既存のファイルまたはシンボリックリンクが見つかりました: $dest"
    echo "バックアップを作成します: $dest.bak"
    mv "$dest" "${dest}.bak"
  fi

  # Create symbolic link
  ln -s "$src" "$dest"
  echo "シンボリックリンクを作成しました: $src -> $dest"
}

# Main process
echo "シンボリックリンクの作成を開始します..."

# Create symbolic links for files
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
    # Create parent directory if necessary
    mkdir -p "$(dirname "$dest")"
    create_symlink "$src" "$dest"
  else
    echo "ディレクトリが見つかりません: $src"
  fi
done

# Install Oh My Zsh
# if [ ! -d "$HOME/.oh-my-zsh" ]; then
#   echo "Oh My Zsh をインストールしています..."
#   /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
# else
#   echo "Oh My Zsh は既にインストールされています。"
# fi
"$DOTFILES_DIR/install/install_ohmyzsh.sh"

echo "インストールが完了しました！"

