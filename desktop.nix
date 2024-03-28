{ config, pkgs, ... }:
{
  imports = [
    ./programs/steam.nix

    ./gnome/theming.nix
    ./gnome/dconf.nix
    ./sway/main.nix
  ];
  
  home.packages = with pkgs;
  [
    gimp
    inkscape
    #jabref
    #obsidian
    #okular
    rnote
    spotify
    telegram-desktop
    #ultrastardx
    #via
    #vial
    #qbittorrent

    exercism

    gnomeExtensions.appindicator
    gnomeExtensions.emoji-selector
    gnomeExtensions.focus
    gnomeExtensions.tailscale-status
    gnomeExtensions.transparent-top-bar
  ];
}
