# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ 
  config, 
  pkgs,
  host,
  username,
  options,
  ... 
}:

{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware.nix
      ./modules/amd-drivers.nix
    ];

  # Bootloader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;


  # Enable networking
  networking.networkmanager.enable = true;
  networking.hostName = "${host}"; # Define your hostname.
  networking.timeServers = options.networking.timeServers.default ++ [ "pool.ntp.org" ];

  # Set your time zone.
  time.timeZone = "Africa/Johannesburg";

  # Select internationalisation properties.
  i18n.defaultLocale = "en_ZA.UTF-8";
  i18n.extraLocaleSettings = {
    LC_ADDRESS = "en_ZA.UTF-8";
    LC_IDENTIFICATION = "en_ZA.UTF-8";
    LC_MEASUREMENT = "en_ZA.UTF-8";
    LC_MONETARY = "en_ZA.UTF-8";
    LC_NAME = "en_ZA.UTF-8";
    LC_NUMERIC = "en_ZA.UTF-8";
    LC_PAPER = "en_ZA.UTF-8";
    LC_TELEPHONE = "en_ZA.UTF-8";
    LC_TIME = "en_ZA.UTF-8";
  };


  # Configure keymap in X11
  services.xserver.xkb = {
    layout = "za";
    variant = "";
  };

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.morgs = {
    isNormalUser = true;
    description = "Morgan";
    extraGroups = [ "networkmanager" "wheel" ];
    packages = with pkgs; [];
  };

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;
  
  #Flakes
  nix.settings.experimental-features = [ "nix-command" "flakes"];

  programs.hyprland.enable = true;
  programs = {
    dconf.enable = true;
    fuse.userAllowOther = true;
    gnupg.agent = {
      enable = true;
      enableSSHSupport = true;
    };
    steam = {
      enable = true;
      gamescopeSession.enable = true;
      remotePlay.openFirewall = true;
      dedicatedServer.openFirewall = true;
    };
  };

  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [
    bat
    brave
    discord
    eza
    ffmpeg
    git
    gh
    greetd.tuigreet
    killall
    kitty
    lm_sensors
    lshw
    meson
    neovim
    networkmanagerapplet
    nh
    nixfmt-rfc-style
    pavucontrol
    pkg-config
    pciutils
    ripgrep
    tree
    unrar
    unzip
    wget
    wl-clipboard
  ];

  # Extra Module Options
  drivers.amdgpu.enable = true;

  # Services
  # RootKit
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
  };

  services.greetd = {
    enable = true;
    vt = 3;
    settings = {
      default_session = {
        user = username;
	command = "${pkgs.greetd.tuigreet}/bin/tuigreet --time --cmd Hyprland";
      };
    };
  };

  system.stateVersion = "24.05"; # Did you read the comment?

}
