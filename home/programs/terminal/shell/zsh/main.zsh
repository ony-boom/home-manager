export PNPM_HOME="$HOME/.local/share/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac

export PATH="$HOME/.deno/bin:$PATH"
export PATH="$HOME/.cargo/bin:$PATH"
export PATH="$HOME/.cargo/bin:$PATH"
export PATH="$HOME/.local/share/JetBrains/Toolbox/scripts:$PATH"
# fpath=(~/.config/zsh/completions $fpath)
# autoload -U compinit
# compinit

# Extra functions
ks() {
  SESSION="$(gum file ~/.config/kitty/sessions)"
  echo "Starting kitty session: $SESSION"
  kitty --session "$SESSION"
}
