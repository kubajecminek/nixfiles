{
  programs.alacritty = {
    enable = true;
    # custom settings
    settings = {
      env.TERM = "xterm-256color";
      window = {
        padding.x = 10;
        padding.y = 10;
        dimensions = {
          columns = 120;
          lines = 35;
        };
        opacity = 0.95;
      };
      font = {
        normal = {
          # TODO: Ensure font is installed
          family = "JetBrainsMono Nerd Font";
          style = "Regular";
        };
        size = 11;
      };
      scrolling.multiplier = 5;
      selection.save_to_clipboard = true;
    };
  };
}
