{
  description = "My nixvim flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";
    nixvim = {
      url = "github:nix-community/nixvim";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs =
    { self, nixpkgs, nixvim, ... }@inputs:
    let
      system = "x86_64-linux";
      pkgs = nixpkgs.legacyPackages.${system};

      nixvimLib = nixvim.lib.${system};
      mkNixvim = nixvim.legacyPackages.${system}.makeNixvim;
      myNixvimConfig = {
        imports = [
          ./config
        ];
      };
      nvim = mkNixvim myNixvimConfig;
    in
    {
      packages.${system}.default = nvim;

      nixosModules.default = myNixvimConfig;

      # test env
      devShells.${system}.default = pkgs.mkShell {
        buildInputs = [
          nvim
        ];
      };

      check.default = nixvimLib.check.mkTestDerivationFromNixvim {
        name = "";
        nvim = nixvim;
      };
    };
}
