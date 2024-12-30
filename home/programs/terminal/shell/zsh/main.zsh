# TMUX setup
ZSH_TMUX_AUTOSTART=true
ZSH_TMUX_AUTOCONNECT=false

# Extra functions
ks() {
  SESSION="$(gum file ~/.config/kitty/sessions)"
  echo "Starting kitty session: $SESSION"
  kitty --session "$SESSION"
}
