{ ... }:
{
  imports = [
    ./services.nix
    ./theme.nix
    ./keybindings.nix
    ./waybar.nix
  ];
  wayland.windowManager.sway = {
    enable = true;
    config = rec {
      modifier = "Mod4";
      terminal = "wezterm"; 
      fonts = {
        names = [ "FiraCode Nerd Font Mono" ];
        style = "Regular";
        size = 11.0;
      };
      window = {
        border = 2;
        titlebar = false;
      };
      gaps = {
        inner = 8;
        outer = -5;
        smartBorders = "on";
        smartGaps = true;
      };
      input = {
        "type:keyboard" = {
          xkb_layout = "de";
          xkb_variant = "nodeadkeys";
        };
        "type:touchpad" = {
          left_handed = "disabled";
          tap = "enabled";
          natural_scroll = "enabled";
          dwt = "enabled";
          accel_profile = "flat";
          pointer_accel = "0.5";
        };
      };
      output = {
        "*" = {
          bg = "~/Pictures/wallpapers/anime/cafe-at-night.png fill";
          scale = "1.25";
        };
      };
    };
  };
}