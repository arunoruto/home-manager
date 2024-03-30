{ pkgs, ... }:
{
  programs.tmux = {
    enable = true;
    clock24 = true;
    shortcut = "Space";
    plugins = with pkgs; [
      tmuxPlugins.catppuccin
      tmuxPlugins.yank
      tmuxPlugins.vim-tmux-navigator
    ];
    extraConfig = ''
      set -g default-terminal "screen-256color"
      set-option -ga terminal-overrides ",alacritty:RGB"
      set -g @catppuccin_flavour "macchiato"

      # Enable mouse support 
      set -g mouse on
    '';
  };
}
