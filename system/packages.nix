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
    config = {
      common = {
        preferred = "hyprland";  # Prioritize xdg-desktop-portal-hyprland
      };
    };
  };

  # Ensure XDG portal services start correctly
  systemd.user.services = {
    xdg-desktop-portal = {
      description = "XDG Desktop Portal";
      wantedBy = [ "graphical-session.target" ];
      partOf = [ "graphical-session.target" ];
      serviceConfig = {
        Type = "dbus";
        BusName = "org.freedesktop.portal.Desktop";
        ExecStart = "${pkgs.xdg-desktop-portal}/libexec/xdg-desktop-portal";
        Restart = "on-failure";
      };
    };
    xdg-desktop-portal-hyprland = {
      description = "XDG Desktop Portal for Hyprland";
      wantedBy = [ "graphical-session.target" ];
      partOf = [ "graphical-session.target" ];
      after = [ "xdg-desktop-portal.service" ];
      requires = [ "xdg-desktop-portal.service" ];
      serviceConfig = {
        Type = "simple";
        ExecStart = "${pkgs.xdg-desktop-portal-hyprland}/libexec/xdg-desktop-portal-hyprland";
        Restart = "on-failure";
      };
    };
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
