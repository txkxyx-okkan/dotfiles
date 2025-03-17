if command -v brew &>/dev/null; then
  echo "Homebrew はすでにインストールされています。"
  echo "Homebrew をアップデートします..."
  brew update
  echo "Homebrew のアップデートが完了しました。"
else
  echo "Homebrew をインストールします..."
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
  echo "Homebrew のインストールが完了しました。"

  # brew コマンドを PATH に追加 (Apple Silicon / Intel 両対応)
  if [[ "$(uname -m)" == "arm64" ]]; then
    echo 'eval "$(/opt/homebrew/bin/brew shellenv)"' >> "$HOME/.zshrc"
    eval "$(/opt/homebrew/bin/brew shellenv)"
  else
    echo 'eval "$(/usr/local/bin/brew shellenv)"' >> "$HOME/.zshrc"
    eval "$(/usr/local/bin/brew shellenv)"
  fi
fi