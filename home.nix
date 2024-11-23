{ 
   pkgs,
   username,
   host,
   ... }:
{
  # This needs to actually be set to your username
  home.username = "${username}";
  home.homeDirectory = "/home/${username}";
  home.stateVersion = "24.05";
     
  # Import Program Configs
  imports = [
    ./neovim.nix
  ];

  # Install & Configure Git
  programs.git = {
    enable = true;
    userName = "Morgs";
    userEmail = "morganc.vandyk@gmail.com";
  };

  # Create XDG Dirs
  xdg = {
    userDirs = {
      enable = true;
      createDirectories = true;
    };
  };
  gtk = {
    iconTheme = {
      name = "Papirus-Dark";
      package = pkgs.papirus-icon-theme;
    };
    gtk3.extraConfig = {
      gtk-application-prefer-dark-theme = 1;
    };
    gtk4.extraConfig = {
      gtk-application-prefer-dark-theme = 1;
    };
  };
  qt = {
    enable = true;
    style.name = "adwaita-dark";
    platformTheme.name = "gtk3";
  };

  # Programs
  programs = {
    gh.enable = true;
    btop = {
     enable = true;
     settings = {
       vim_keys = true;
     };
    };
    kitty = {
     enable = true;
     package = pkgs.kitty;
     settings = {
       scrollback_lines = 2000;
       wheel_scroll_min_lines = 1;
       window_padding_width = 4;
       confirm_os_window_close = 0;
     };
     extraConfig = ''
       tab_bar_style fade
       tab_fade 1
       active_tab_font_style   bold
       inactive_tab_font_style bold
     '';
    };
    bash = {
      enable = true;
      enableCompletion = true;
      shellAliases = {
        svim = "sudo nvim";
	vim = "nvim";
	ncg = "nix-collect-garbage --delete-old && sudo nix-collect-garbage -d && sudo /run/current-system/bin/switch-to-configuration boot";
      };
    };
  };
  #home-manager.enable = true;
}
