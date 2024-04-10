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
      lsp = {
        enable = true;
        servers = {
          #pyright.enable = true;
          ruff-lsp.enable = true;
          julials.enable = true;
          nixd.enable = true;
        };
      };
      nvim-tree = {
        enable = true;
        git.enable = true;
        diagnostics = {
          enable = true;
          icons = {
            hint = "";
            info = "";
            warning = "";
            error = "";
          };
        };
      };
      alpha = {
        enable = true;
        iconsEnabled = false;
        theme = "dashboard";
      };
      #startup-nvim.enable = true;
      treesitter.enable = true;
      nix.enable = true;
    };
    extraPlugins = with pkgs.vimPlugins; [
      nvim-web-devicons
    ];
    keymaps = [
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
  };

}
