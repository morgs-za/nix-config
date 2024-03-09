{ pkgs, config, inputs, ... }:

{
  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  # List System Programs
  environment.systemPackages = with pkgs; [
    wget 
    curl 
    git
    github-cli
    cmatrix 
    lolcat 
    neofetch 
    btop 
    polkit_gnome 
    lm_sensors 
    unzip 
    unrar 
    libnotify 
    eza
    ydotool 
    wl-clipboard 
    socat 
    cowsay 
    lsd 
    lshw
    pkg-config 
    meson 
    hugo 
    gnumake 
    ninja 
    go 
    symbola
    noto-fonts-color-emoji 
    material-icons brightnessctl
    toybox 
    swappy 
    ripgrep 
    appimage-run 
    networkmanagerapplet 
    yad 
    playerctl 
    nh
  ];

  programs = {
    steam.gamescopeSession.enable = true;
    dconf.enable = true;
    seahorse.enable=true;
    hyprland = {
      enable = true;
      package = inputs.hyprland.packages.${pkgs.system}.hyprland;
      xwayland.enable = true;
    };
    fuse.userAllowOther = true;
    mtr.enable = true;
    gnupg.agent = {
      enable = true;
      enableSSHSupport = true;
    };
    #virt-manager.enable = true;
  };

  #virtualisation.libvirtd.enable = true;
}
