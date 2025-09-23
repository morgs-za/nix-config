{ pkgs, ... }:

{
  programs.kitty = {
    enable = true;
    themeFile = "Catppuccin-Mocha";
    settings = {
      font_size = 18;
      scrollback_lines = 10000;
    };
  };
}
