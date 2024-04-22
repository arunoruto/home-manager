{ config, pkgs, ... }:
{
  imports = [
    ./shell
    ./programs
  ];

  home.packages = with pkgs;
  [
    speedtest-cli

    hugo
    julia
    #ruff

    zsh-autosuggestions
    zsh-syntax-highlighting
  ];
}
