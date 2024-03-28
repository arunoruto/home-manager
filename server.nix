{ config, pkgs, ... }:
{
  imports = [
    ./shell.nix
    ./programs/vim.nix
    ./programs/git.nix
    ./programs/python.nix
    ./programs/terminal.nix
  ];

  home.packages = with pkgs;
  [
    speedtest-cli

    hugo
    julia

    zsh-autosuggestions
    zsh-syntax-highlighting
  ];
}
