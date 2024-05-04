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
    vivid

    zsh-autosuggestions
    zsh-syntax-highlighting
  ];
}
