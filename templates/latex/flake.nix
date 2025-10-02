{
  description = "A LaTeX template with my neovim configuration.";

  inputs = {
    mynixvim.url = "github:pedro-moren0/neovim-config";
  };

  outputs =
    { nixpkgs, mynixvim, ... }:
    let
      system = "x86_64-linux";
      pkgs = nixpkgs.legacyPackages.${system};

      nvim = mynixvim.outputs.packages.${system}.default.extend {
        plugins.vimtex = {
          enable = true;
          texlivePackage = null; # use local environment texlive
        };
      };
    in
    {
      devShells.${system}.default = pkgs.mkShell {
        buildInputs = [
          nvim
        ];
      };
    };
}
