{ config, pkgs, ... }:
{
  options = { };
  config = {
    viAlias = true;
    vimAlias = true;
    opts = {
      number = true;
      relativenumber = true;

      termguicolors = true;

      signcolumn = "yes";

      cursorline = true;
      ruler = true;

      tabstop = 2;
      shiftwidth = 2;
      softtabstop = 2;
      expandtab = true;
      autoindent = true;
    };

    # Nixvim opts
    colorschemes.dracula.enable = true;
    plugins = {
      lualine.enable = true;
      bufferline.enable = true;
      telescope.enable = true;
      oil.enable = true;
      mini = {
        enable = true;
        mockDevIcons = true;
        modules.icons.enable = true;
      };

      nix.enable = true;
      comment.enable = true;
    };
  };
}
