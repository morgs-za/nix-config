{ config, pkgs, ... }:

{
  imports = [
    ./amd-gpu.nix
    ./appimages.nix
    ./autorun.nix
    ./boot.nix
    ./displaymanager.nix
    ./flatpak.nix
    ./hwclock.nix
    ./kernel.nix
    ./ntp.nix
    ./packages.nix
    ./polkit.nix
    ./python.nix
    ./services.nix
    ./steam.nix
  ];
}
