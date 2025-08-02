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
    {
      self,
      nixpkgs,
      nixvim,
      ...
    }:
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

      templates = {
        latex = {
          path = "./templates/latex";
          description = "A LaTeX template with my neovim configuration.";
        };
        defaultTemplate = self.templates.latex;
      };

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
