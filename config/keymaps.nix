{ ... }:
{
  keymaps = [
    {
      mode = "n";
      key = "<C-n>";
      action = "<cmd>Oil --float<CR>";
      options.silent = true;
    }
  ];
}
