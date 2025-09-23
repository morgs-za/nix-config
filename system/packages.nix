{ pkgs, ... }:

{
  nixpkgs.config.allowUnfree = true;

  environment.systemPackages = with pkgs; [
    xdg-user-dirs
    xdg-utils
    btop
    bat
    curl
    wget
    iputils
    zip
    unzip
    p7zip
    wl-clipboard
    grim
    slurp
    wf-recorder
    noto-fonts
    udisks2
    cage
    greetd.gtkgreet
    brightnessctl
  ];

  # Enable PipeWire for audio
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;  # PulseAudio compatibility
    jack.enable = true;   # JACK compatibility
  };

  nix = {
    package = pkgs.nixVersions.stable;
    extraOptions = ''
      experimental-features = nix-command flakes
    '';
    settings = {
      auto-optimise-store = true;
    };
  };

  xdg.portal = {
    enable = true;
    wlr.enable = true;  # Enable Wayland-specific portal
    extraPortals = [ 
      pkgs.xdg-desktop-portal-hyprland 
      pkgs.xdg-desktop-portal-gtk 
      pkgs.xdg-desktop-portal
    ];
    configPackages = [
      pkgs.xdg-desktop-portal-hyprland
      pkgs.xdg-desktop-portal-gtk
    ];
  };

  # Environment variables for XDG portal
  environment.sessionVariables = {
    NIXOS_OZONE_WL = "1";
    XDG_CURRENT_DESKTOP = "Hyprland";
    XDG_SESSION_DESKTOP = "Hyprland";
    XDG_SESSION_TYPE = "wayland";
  };

  home-manager.backupFileExtension = "backup";
}
