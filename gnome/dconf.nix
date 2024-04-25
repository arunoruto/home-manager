#{ config, pkgs, lib, ... }:
{ lib, ... }:
{
  dconf.settings = {
    # Time zone settings
    "org/gnome/desktop/datetime" = { automatic-timezone = true; };
    "org/gnome/system/location" = { enabled = true; };
    # Wallpaper settings
    "org/gnome/desktop/background" = {
      color-shading-type = "solid";
      picture-options = "zoom";
      picture-uri      = "file://${builtins.getEnv "HOME"}/.local/share/backgrounds/komet/komet.xml";
      picture-uri-dark = "file://${builtins.getEnv "HOME"}/.local/share/backgrounds/komet/komet.xml";
    };
    # Set some interface options found in tweaks
    "org/gnome/desktop/interface" = {
      show-battery-percentage = true;
    #  color-scheme = "default";
    #  cursor-theme = "Catppuccin-Macchiato-Dark-Cursors";
      gtk-theme = lib.mkForce "Catppuccin-Macchiato-Standard-Green-Dark";
      icon-theme = lib.mkForce "candy-icons";
    };
    # Set list of custom keybinding
    "org/gnome/settings-daemon/plugins/media-keys" = {
      custom-keybindings = [
        "/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom0/"
        #"/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom1/"
        "/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom2/"
      ];
    };
    # The keybindings to mention above
    "org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom0" = {
      name = "Terminal Super";
      #command = "env WAYLAND_DISPLAY= alacritty";
      command = "wezterm start --always-new-process";
      binding = "<Super>Return";
    };
    #"org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom1" = {
    #  name = "Tailscale Switch";
    #  command = "tailscale switch $(tailscale switch --list | tail -n +2 | rofi -dmenu | cut -d' ' -f1)";
    #  binding = "<Shift><Super>t";
    #};
    "org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom2" = {
      name = "emoji picker";
      command = "flatpak run it.mijorus.smile";
      binding = "<Control>less";
    };
  };

}
