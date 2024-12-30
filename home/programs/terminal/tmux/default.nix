{pkgs, ...}: {
  programs.tmux = {
    enable = true;
    baseIndex = 1;
    escapeTime = 10;
    mouse = true;
    prefix = "C-a";

    plugins = with pkgs; [
      {
        plugin = tmuxPlugins.resurrect;
        extraConfig = "set -g @resurrect-strategy-nvim 'session'";
      }
      tmuxPlugins.urlview
      {
        plugin = tmuxPlugins.rose-pine;
        extraConfig = ''
          set -g @rose_pine_variant 'main'
          set -g @rose_pine_user 'on'
          set -g @rose_pine_bar_bg_disable 'on' # Disables background color, for transparent terminal emulators

          # If @rose_pine_bar_bg_disable is set to 'on', uses the provided value to set the background color
          # It can be any of the on tmux (named colors, 256-color set, `default` or hex colors)
          # See more on http://man.openbsd.org/OpenBSD-current/man1/tmux.1#STYLES
          set -g @rose_pine_bar_bg_disabled_color_option 'default'

          set -g @rose_pine_only_windows 'off' # Leaves only the window module, for max focus and space
          set -g @rose_pine_disable_active_window_menu 'on' # Disables the menu that shows the active window on the left

          set -g @rose_pine_default_window_behavior 'on' # Forces tmux default window list behaviour
          set -g @rose_pine_show_current_program 'on' # Forces tmux to show the current running program as window name

          set -g @rose_pine_left_separator ':' # The strings to use as separators are 1-space padded
          set -g @rose_pine_right_separator ' ' # Accepts both normal chars & nerdfont icons
          set -g @rose_pine_window_separator ' ' # Replaces the default `:` between the window number and name

          # These are not padded
          set -g @rose_pine_session_icon '' # Changes the default icon to the left of the session name
          set -g @rose_pine_current_window_icon '' # Changes the default icon to the left of the active window name
          set -g @rose_pine_window_status_separator "  " # Changes the default icon that appears between window names
        '';
      }
    ];
    extraConfig = builtins.readFile ./tmux.conf;
  };
}
