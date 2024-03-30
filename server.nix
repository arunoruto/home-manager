{ config, pkgs, ... }:
{
  imports = [
    ./shell
    #./programs/vim.nix
    ./programs/nvim
    ./programs/git.nix
    ./programs/python.nix
    ./programs/terminal
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
