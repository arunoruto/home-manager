{pkgs, ...}: {
  programs.nixvim = {
    extraPlugins = [
      (pkgs.vimUtils.buildVimPlugin {
        name = "venv-selector";
        src = builtins.fetchGit {
          url = "https://github.com/linux-cultist/venv-selector.nvim";
          ref = "main";
        };
      })
    ];
    extraConfigLua = ''
      require("venv-selector").setup({})
    '';
    keymaps = [
      {
        mode = "n";
        key = "<leader>vs";
        action = "<cmd>VenvSelect<cr>";
        options = {
          desc = "Open VenvSelector to pick a venv";
          silent = true;
        };
      }
      {
        mode = "n";
        key = "<leader>vc";
        action = "<cmd>VenvSelectCached<cr>";
        options = {
          desc = "Retrieve the venv from cache previously used in same project dir";
          silent = true;
        };
      }
    ];
  };
}
