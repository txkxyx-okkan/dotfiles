ZSH_CUSTOM=${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}
AUTOCOMPLETE_DIR="$ZSH_CUSTOM/plugins/zsh-autocomplete"

if [ -d "$AUTOCOMPLETE_DIR" ]; then
  echo "zsh-autocomplete はすでにインストールされています。"
else
  echo "zsh-autocomplete をインストールします..."
  git clone --depth=1 https://github.com/marlonrichert/zsh-autocomplete.git "$AUTOCOMPLETE_DIR"
  echo "zsh-autocomplete のインストールが完了しました。"
fi