$env.config = {
  show_banner: false,
}

$env.PATH = (
  $env.PATH
  | split row (char esep)
  | append ($env.HOME | path join .cargo bin)
  | append ($env.HOME | path join .deno bin)
  | append ($env.HOME | path join .local share pnpm)
  | uniq
)

def ks [] {
  let session = $"(gum file ~/.config/kitty/sessions)"
  print $"Starting kitty session: ($session)"
  zsh -c "kitty session $session"
}
