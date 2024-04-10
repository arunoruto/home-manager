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

    zsh-autosuggestions
    zsh-syntax-highlighting
  ];
}
