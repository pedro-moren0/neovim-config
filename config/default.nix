{ ... }:
{
  imports = [
    ./options.nix
    ./plugins.nix
    ./keymaps.nix
  ];

  config = {
    viAlias = true;
    vimAlias = true;

    colorschemes.gruvbox.enable = true;

    extraConfigLuaPre = ''
      local ls = require("luasnip")
    '';
  };
}
