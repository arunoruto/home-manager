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

    fzf
    hugo
    julia
		lsd
    thefuck
    yazi
    zoxide

    zsh-autosuggestions
    zsh-syntax-highlighting
  ];
}
