{ helpers, ... }:
{
  globals = {
    mapleader = " ";
    maplocalleader = " ";
  };

  keymaps = helpers.keymaps.mkKeymaps {
    mode = "n";
    options.silent = true;
  }
  [
    {
        action = ":NvimTreeToggle<cr>";
        key = "<C-n>";
        options = {
          silent = true;
          desc = "Nvim Tree: Toggle";
        };
      }
      {
        action = ":NvimTreeToggle<cr>";
        key = "<leader>tt";
        options = {
          silent = true;
          desc = "Nvim Tree: Toggle";
        };
      }
      {
        action = ":NvimTreeRefresh<cr>";
        key = "<leader>tr";
        options = {
          silent = true;
          desc = "Nvim Tree: Refresh";
        };
      }
      {
        action = ":NvimTreeFindFile<cr>";
        key = "<leader>tf";
        options = {
          silent = true;
          desc = "Nvim Tree: Find File";
        };
      }
  ];
}
