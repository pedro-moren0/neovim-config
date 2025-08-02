{ ... }:
{
  keymaps = [

    # Oil
    {
      mode = "n";
      key = "<C-n>";
      action = "<cmd>Oil --float<CR>";
      options.silent = true;
    }

    # Telescope
    {
      key = "<leader>ff";
      action = "<cmd>Telescope find_files<CR>";
    }
    {
      key = "<leader>fw";
      action = "<cmd>Telescope live_grep<CR>";
    }

    # Luasnip
    {
      mode = "i";
      key = "<C-K>";
      action.__raw = ''
        function()
          ls.expand()
        end
      '';
      options.silent = true;
    }
    {
      mode = [
        "i"
        "s"
      ];
      key = "<C-L>";
      action.__raw = ''
        function()
          ls.jump(1)
        end
      '';
      options.silent = true;
    }
    {
      mode = [
        "i"
        "s"
      ];
      key = "<C-J>";
      action.__raw = ''
        function()
          ls.jump(-1)
        end
      '';
      options.silent = true;
    }
    {
      mode = [
        "i"
        "s"
      ];
      key = "<C-E>";
      action.__raw = ''
        function()
          if ls.choice_active() then
            ls.change_choice(1)
          end
        end
      '';
      options.silent = true;
    }

    # Others
    {
      mode = "n";
      key = "<leader>bd";
      action = "<cmd>bdelete<CR>";
    }
  ];
}
