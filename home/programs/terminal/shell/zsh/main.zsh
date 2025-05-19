c() { printf "%s\n" "$@" | bc -l; }

# go task autocomplete
eval "$(task --completion zsh)"
