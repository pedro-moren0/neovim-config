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

    diagnostic.settings = {
      virtual_text = false;
      virtual_lines = true;
    };

    colorschemes.vscode.enable = true;

    extraConfigLuaPre = ''
      local ls = require("luasnip")
    '';
  };
}
