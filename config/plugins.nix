{ ... }:
{
  plugins = {
    lsp = {
      enable = true;
      inlayHints = true;

      servers = {
        nixd = {
          enable = true;
          settings = {
            formatting.command = [ "nixfmt" ];
            nixpkgs.expr = "import <nixpkgs> {}";
          };
        };
        ccls.enable = true;
      };
    };

    luasnip = {
      enable = true;
      settings = {
        enable_autosnippets = true;
        store_selection_keys = "<Tab>";
        update_events = "TextChanged,TextChangedI";
      };
      fromLua = [
        {
          paths = ./snippets;
        }
      ];
    };

    lualine.enable = true;
    bufferline.enable = true;
    telescope.enable = true;
    oil = {
      enable = true;
      settings = {
        keymaps = {
          "<C-t>" = false;    # disable open in tabs -- buffer gang
        };
        view_options.show_hidden = true;
      };
    };
    mini = {
      enable = true;
      mockDevIcons = true;
      modules.icons.enable = true;
    };

    nix.enable = true;
    comment.enable = true;
  };
}
