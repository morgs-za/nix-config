{ ... }:

{
  imports = [
    ./boot.nix
    ./networking.nix
    ./users.nix
    ./packages.nix
    ./hyprland.nix
    ./hardware.nix
    ./greetd.nix
  ];

  system.stateVersion = "25.05";
}
