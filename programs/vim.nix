{ config, pkgs, lib, ... }:
let
  sysconfig = if builtins.pathExists "/etc/nixos/configuration.nix" then
    (import <nixpkgs/nixos> {}).config
  else
    "other";
  nixvim = import (builtins.fetchGit {
    url = "https://github.com/nix-community/nixvim";
    #ref = "nixos-${sysconfig.system.stateVersion}";
    #ref = "nixos-${config.home.stateVersion}";
    #ref = "nixos-${config.system.nixos.release}";
    ref = if (sysconfig == "other") then "main" else "nixos-${sysconfig.system.stateVersion}";
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
      comment.enable = true;
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

}
