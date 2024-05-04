{ pkgs, ... }:
{
  programs.nixvim = {
    extraPlugins = with pkgs.vimPlugins; [
      (pkgs.vimUtils.buildVimPlugin {
        name = "vim-maximizer";
        src = builtins.fetchGit {
          url = "https://github.com/szw/vim-maximizer";
          ref = "master";
        };
      })
    ];
    keymaps = [
      { mode ="n"; key = "<leader>sm"; action = "<cmd>MaximizerToggle<CR>"; options.desc = "Maximize/minimize a split"; }
    ];
  };
}
