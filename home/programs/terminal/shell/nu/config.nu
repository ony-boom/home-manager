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
