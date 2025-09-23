{ pkgs, inputs, ... }:

{
  imports = [
    ./hyprland.nix
    ./kitty.nix
    ./nixvim.nix
    ./starship.nix
    ./git.nix
  ];

  home.stateVersion = "25.05";
}
