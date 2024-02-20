{ pkgs, lib, ... }:
let
  sysconfig = (import <nixpkgs/nixos> {}).config;
  nixvim = import (builtins.fetchGit {
    url = "https://github.com/nix-community/nixvim";
    ref = "nixos-${sysconfig.system.stateVersion}";
  });
in
{
  imports = [ nixvim.homeManagerModules.nixvim ];

  programs.nixvim = {
    enable = true;
    options = {
    	tabstop = 2;
	    softtabstop = 2;
	    shiftwidth = 2;
	    expandtab = true;

      number = true;
      relativenumber = true;

      termguicolors = true;
      mouse = "a";
    };
    globals = {
      mapleader = " ";
    };
    colorschemes.catppuccin = {
      enable = true;
      flavour = "macchiato";
    };
    plugins = {
      bufferline.enable = true;
      comment-nvim.enable = true;
      lsp = {
        enable = true;
        servers = {
          pyright.enable = true;
          julials.enable = true;
        };
      };
      #startup.enable = true;
      treesitter.enable = true;
    };
  };

  #programs.neovim = {
  #  enable = true;
  #  extraLuaConfig = builtins.readFile(./neovim/init.lua);
  #  #extraLuaConfig = ''
  #  #  vim.opt.tabstop = 2
  #  #  vim.opt.softtabstop = 2
  #  #  vim.opt.shiftwidth = 2
	#	#	vim.opt.expandtab = true

	#	#	-- set theme
  #  #  vim.cmd.colorscheme('catppuccin-macchiato')

  #  #  require("nvim-tree").setup()
  #  #'';
  #  plugins = with pkgs.vimPlugins; [
  #    bufferline-nvim
  #    catppuccin-nvim
  #    comment-nvim
  #    legendary-nvim
  #    lualine-nvim
  #    {
  #      plugin = nvim-cmp;
  #      config = builtins.readFile(./neovim/plugins/cmp.lua);
  #      type = "lua";
  #    }
  #    {
  #      plugin = nvim-tree-lua;
  #      config = builtins.readFile(./neovim/plugins/nvim-tree.lua);
  #      type = "lua";
  #    }
  #    nvim-treesitter.withAllGrammars
  #  ];
  #};

}
