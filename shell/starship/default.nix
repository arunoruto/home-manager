{
  pkgs,
  lib,
  ...
}: let
  flavour = "macchiato";
  catppuccin-starship = builtins.fetchGit {
    url = "https://github.com/catppuccin/starship";
    ref = "main";
  };
in {
  imports = [
    ./definitions
  ];

  programs.starship = {
    enable = true;
    settings =
      {
        character = {
          success_symbol = "[[󰄛](green) ❯](maroon)";
          error_symbol = "[❯](red)";
          vimcmd_symbol = "[❮](green)";
        };
        palette = "catppuccin_${flavour}";
      }
      // builtins.fromTOML (builtins.readFile
        (catppuccin-starship + /palettes/${flavour}.toml));
  };
}
