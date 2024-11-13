$env.config = {
  show_banner: false,
}

$env.PATH = (
  $env.PATH
  | split row (char esep)
  | append ($env.HOME | path join .cargo bin)
  | append ($env.HOME | path join .deno bin)
  | uniq
)

def ks [] {
  let session = $"(gum file ~/.config/kitty/sessions)"
  print $"Starting kitty session: ($session)"
  kitty session $session
}
