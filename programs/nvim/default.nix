{ config, pkgs, lib, ... }:
let
  sysconfig = if builtins.pathExists "/etc/nixos/configuration.nix" then
    (import <nixpkgs/nixos> {}).config
  else
    "other";
  nixvim = import (builtins.fetchGit {
    url = "https://github.com/nix-community/nixvim";
    ref = if (sysconfig == "other") then "main" else "nixos-${sysconfig.system.stateVersion}";
  });
in
{
  imports = [
    nixvim.homeManagerModules.nixvim
    #./keymaps.nix
    ./alpha.nix
    ./comment.nix
    ./nvim-tree.nix
    ./lualine.nix
    ./lsp.nix
  ];

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
      nvim-cmp = {
        enable = true;
        autoEnableSources = true;
      };
      #comment.enable = true;
      comment-nvim.enable = true;
      telescope = {
        enable = true;
      };
      which-key = {
        enable = true;
      };
      #startup-nvim.enable = true;
      treesitter.enable = true;
      gitsigns.enable = true;
      # https://ejmastnak.com/tutorials/vim-latex/vimscript/
      vimtex.enable = true;
      nix.enable = true;
    };
    extraPlugins = with pkgs.vimPlugins; [
      nvim-web-devicons
      cheatsheet-nvim
    ];
    extraConfigLua = ''
    '';
    keymaps = [
    ];
  };

}
