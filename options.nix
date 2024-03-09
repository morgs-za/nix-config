# PLEASE READ THE WIKI FOR DETERMINING
# WHAT TO PUT HERE AS OPTIONS. 
# https://gitlab.com/Zaney/zaneyos/-/wikis/Setting-Options

let
  # THINGS YOU NEED TO CHANGE
  username = "morgs";
  hostname = "morgan-desktop";
  userHome = "/home/${username}";
  flakeDir = "${userHome}/nix-config";
  waybarStyle = "simplebar"; # simplebar, slickbar, or default
in {
  # User Variables
  username = "morgs";
  hostname = "morgan-desktop";
  gitUsername = "Morgan van Dyk";
  gitEmail = "morganc.vandyk@gmail.com";
  theme = "tokyo-night-dark";
  slickbar = if waybarStyle == "slickbar" then true else false;
  simplebar = if waybarStyle == "simplebar" then true else false;
  bar-number = true; # Enable / Disable Workspace Numbers In Waybar
  borderAnim = true;
  browser = "firefox";
  wallpaperGit = "https://gitlab.com/Zaney/my-wallpapers.git"; # This will give you my wallpapers
  # ^ (use as is or replace with your own repo - removing will break the wallsetter script) 
  wallpaperDir = "${userHome}/Pictures/Wallpapers";
  screenshotDir = "${userHome}/Pictures/Screenshots";
  flakeDir = "${flakeDir}";
  flakePrev = "${userHome}/.zaneyos-previous";
  flakeBackup = "${userHome}/.zaneyos-backup";
  terminal = "kitty"; # This sets the terminal that is used by the hyprland terminal keybinding

  # System Settings
  clock24h = true;
  theLocale = "en_ZA.UTF-8";
  theKBDLayout = "us";
  theSecondKBDLayout = "za";
  theKBDVariant = "";
  theLCVariables = "en_ZA.UTF-8";
  theTimezone = "Africa/Johannesburg";
  theShell = "bash"; # Possible options: bash, zsh
  theKernel = "default"; # Possible options: default, latest, lqx, xanmod, zen
  sdl-videodriver = "wayland"; # Either x11 or wayland ONLY. Games might require x11 set here
  # For Hybrid Systems intel-nvidia
  # Should Be Used As gpuType
  cpuType = "amd";
  gpuType = "amd";

  # NTP & HWClock Settings
  ntp = true;
  localHWClock = false;

  # Enable Flatpak & Larger Programs
  flatpak = true;

  # Enable Terminals
  # If You Disable All You Get Kitty
  kitty = true;

  # Enable Python & PyCharm
  python = false;
}
