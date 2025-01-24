{
  description = "MorgsOS";
  
  inputs = {
    nixpkgs.url = "github:Nixos/nixpkgs/nixos-unstable";
    nvf.url = "github:notashelf/nvf";
  };
  
  outputs = { nixpkgs, nvf, ...}: {
    nixosConfigurations.morgan-desktop = nixpkgs.lib.nixosSystem {
      modules = [
        nvf.nixosModules.default
        ./system/config.nix
      ];
    };
  };
}
