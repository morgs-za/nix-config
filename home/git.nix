{ pkgs, ... }:

{
  programs.git = {
    enable = true;
    userName = "Morgs";
    userEmail = "morganc.vandyk@gmail.com";
    extraConfig = {
      url."git@github.com:".insteadOf = "https://github.com/";
      init.defaultBranch = "main";
    };
  };

  home.packages = with pkgs; [
    git
  ];
}
