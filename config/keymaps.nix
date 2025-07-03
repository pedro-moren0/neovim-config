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
      mode = ["i" "s"];
      key = "<C-L>";
      action.__raw = ''
        function()
          ls.jump(1)
        end
      '';
      options.silent = true;
    }
    {
      mode = ["i" "s"];
      key = "<C-J>";
      action.__raw = ''
        function()
          ls.jump(-1)
        end
      '';
      options.silent = true;
    }
    {
      mode = ["i" "s"];
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
  ];
}
