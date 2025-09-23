{ inputs, ... }:

{
  imports = [
    inputs.nixvim.homeManagerModules.nixvim
  ];

  programs.nixvim = {
    enable = true;
    defaultEditor = true;
    viAlias = true;
    vimAlias = true;
    colorschemes.catppuccin.enable = true;
    plugins = {
      lsp.enable = true;
      treesitter.enable = true;
      telescope.enable = true;
      web-devicons.enable = true;
    };
  };
}
