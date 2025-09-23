{ config, pkgs, ... }:

{
  imports = [
    ./hardware-configuration.nix
  ];

  # Bootloader
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  networking.hostName = "morgan-desktop";
  networking.networkmanager.enable = true;

  time.timeZone = "Africa/Johannesburg";

  i18n.defaultLocale = "en_ZA.UTF-8";

  services.xserver.xkb = {
    layout = "za";
    variant = "";
  };

  # User account
  users.users.morgs = {
    isNormalUser = true;
    description = "Morgs";
    extraGroups = [ "networkmanager" "wheel" ];
  };

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  # Enable Hyprland system-wide
  programs.hyprland = {
    enable = true;
    package = pkgs.hyprland;  # Use Hyprland from nixos-25.05
    xwayland.enable = true;
  };

  # System packages
  environment.systemPackages = with pkgs; [
    xdg-user-dirs
  ];

  # Enable flakes and nix-command
  nix = {
    package = pkgs.nixVersions.stable;
    extraOptions = ''
      experimental-features = nix-command flakes
    '';
    settings = {
      auto-optimise-store = true;
    };
  };

  # XDG portals for Hyprland
  xdg.portal = {
    enable = true;
    extraPortals = [ pkgs.xdg-desktop-portal-hyprland pkgs.xdg-desktop-portal-gtk ];
  };

  # Environment variable for Wayland
  environment.sessionVariables.NIXOS_OZONE_WL = "1";

  # Home Manager backup for conflicting files
  home-manager.backupFileExtension = "backup";

  system.stateVersion = "25.05";
}
