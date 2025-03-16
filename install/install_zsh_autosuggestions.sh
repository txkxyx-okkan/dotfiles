ZSH_CUSTOM=${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}
AUTOSUGGESTIONS_DIR="$ZSH_CUSTOM/plugins/zsh-autosuggestions"

if [ -d "$AUTOSUGGESTIONS_DIR" ]; then
  echo "zsh-autosuggestions はすでにインストールされています。"
else
  echo "zsh-autosuggestions をインストールします..."
  git clone --depth=1 https://github.com/zsh-users/zsh-autosuggestions.git "$AUTOSUGGESTIONS_DIR"
  echo "zsh-autosuggestions のインストールが完了しました。"
fi