{
  programs.nixvim = {
    plugins = {
      dap = {
        enable = true;
      };
    };
    keymaps = [
      # {
      #   mode = "n";
      #   key = "<leader>ft";
      #   action = "<cmd>TodoTelescope<CR>";
      #   options = {
      #     silent = true;
      #     desc = "Find TODOs";
      #   };
      # }
    ];
  };
}
