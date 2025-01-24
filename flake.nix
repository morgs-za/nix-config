{
  description = "MorgsOS";
  
  inputs = {
    nixpkgs.url = "github:Nixos/nixpkgs/nixos-unstable";
    nvf.url = "github:notashelf/nvf";
  };
  
  outputs = { nixpkgs, nvf, ...}@inputs: 
    let
       system = "x86_64-linux";
       host = "morgan-desktop";
       username = "morgs";
    in
    {
    nixosConfigurations = {
      "${host}" = nixpkgs.lib.nixosSystem {
      specialArgs = {
        inherit system;
        inherit inputs;
        inherit username;
        inherit host;
      };
      modules = [
        nvf.nixosModules.default
        ./system/config.nix
      ];
    };
  };
  };
}
