{pkgs, ...}: {
  programs.nixvim = {
    extraPlugins = [
      (pkgs.vimUtils.buildVimPlugin {
        name = "actions-preview";
        src = builtins.fetchGit {
          url = "https://github.com/aznhe21/actions-preview.nvim";
          ref = "master";
        };
      })
    ];
    keymaps = [
      {
        mode = ["n" "v"];
        key = "<leader>fa";
        action = ''require("actions-preview").code_actions'';
        lua = true;
        options = {
          desc = "Display code actions in telescope";
          silent = true;
        };
      }
    ];
    extraConfigLua = ''
    '';
  };
}
