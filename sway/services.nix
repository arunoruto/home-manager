{ config, pkgs, ... }:
let
  catppuccin_rofi = builtins.fetchGit {
    url = "https://github.com/catppuccin/rofi";
    ref = "main";
  };
in
{
  programs.rofi = {
    enable = true;
    font = "FiraCode Nerd Font Mono 14";
    theme = "${catppuccin_rofi}/basic/.local/share/rofi/themes/catppuccin-macchiato.rasi";
  };
}
