{ pkgs, ... }:

{
  programs.hyprland = {
    enable = true;
    package = pkgs.hyprland;  # Use Hyprland from nixos-25.05
    xwayland.enable = true;
  };
}
