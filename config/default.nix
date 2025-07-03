{ ... }:
{
  imports = [
    ./globalOpts.nix
    ./plugins.nix
    ./keymaps.nix
  ];

  config = {
    viAlias = true;
    vimAlias = true;

    colorschemes.gruvbox.enable = true;
  };
}
