{
  description = "My nixvim flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";
    nixvim = {
      url = "github:nix-community/nixvim";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { self, nixvim, ... }@inputs:
  let
    system = "x86_64-linux";
    mkNixvim = nixvim.legacyPackages.${system}.makeNixvim;
  in
  {
    packages.${system}.default = mkNixvim {
      imports = [
        ./default.nix
      ];
    };
  };
}
