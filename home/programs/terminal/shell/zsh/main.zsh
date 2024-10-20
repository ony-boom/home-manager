export PNPM_HOME="$HOME/.local/share/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac

export PATH="/home/ony/.bun/bin:$PATH"

# Extra functions
ks() {
  SESSION="$(gum file ~/.config/kitty/sessions)"
  echo "Starting kitty session: $SESSION"
  kitty --session "$SESSION"
}
