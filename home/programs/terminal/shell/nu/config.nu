$env.config.show_banner = false

$env.config.buffer_editor = "nvim"

$env.PROMPT_INDICATOR_VI_NORMAL = " "
$env.PROMPT_INDICATOR_VI_INSERT = " "

$env.config.edit_mode = 'vi'
$env.config.cursor_shape.vi_insert = "blink_line"
$env.config.cursor_shape.vi_normal = "block"


$env.PROMPT_INDICATOR = ""
$env.PROMPT_INDICATOR_VI_INSERT = ""
$env.PROMPT_INDICATOR_VI_NORMAL = ""
$env.PROMPT_MULTILINE_INDICATOR = "󰌑 "


# $env.PATH = (
#   $env.PATH
#   | split row (char esep)
#   | append ($env.HOME | path join .cargo bin)
#   | append ($env.HOME | path join .deno bin)
#   | append ($env.HOME | path join .local share pnpm)
#   | uniq
# )
