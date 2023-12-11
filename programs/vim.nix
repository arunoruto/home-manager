{ pkgs, lib, ... }:
let
  nixvim = import (builtins.fetchGit {
    url = "https://github.com/nix-community/nixvim";
    ref = "nixos-23.05";
  });
in
{
  imports = [ nixvim.homeManagerModules.nixvim ];

  programs.neovim = {
    enable = true;
    extraLuaConfig = builtins.readFile(./neovim/init.lua);
    #extraLuaConfig = ''
    #  vim.opt.tabstop = 2
    #  vim.opt.softtabstop = 2
    #  vim.opt.shiftwidth = 2
		#	vim.opt.expandtab = true

		#	-- set theme
    #  vim.cmd.colorscheme('catppuccin-macchiato')

    #  require("nvim-tree").setup()
    #'';
    plugins = with pkgs.vimPlugins; [
      bufferline-nvim
      catppuccin-nvim
      comment-nvim
      legendary-nvim
      lualine-nvim
      {
        plugin = nvim-cmp;
        config = builtins.readFile(./neovim/plugins/cmp.lua);
        type = "lua";
      }
      {
        plugin = nvim-tree-lua;
        config = builtins.readFile(./neovim/plugins/nvim-tree.lua);
        type = "lua";
      }
      nvim-treesitter.withAllGrammars
    ];
  };

  programs.nixvim = {
    enable = false;
    #plugins = {
    #  lsp.enable = false;
    #};
  };
}
