# Extra functions
ks() {
  SESSION="$(gum file ~/.config/kitty/sessions)"
  echo "Starting kitty session: $SESSION"
  kitty --session "$SESSION"
}
