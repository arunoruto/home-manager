{ pkgs, ... }:
{
  programs.tmux = {
    enable = true;
    clock24 = true;
    shortcut = "Space";
    terminal = "screen-256color";
    keyMode = "vi";
    mouse = true;
    baseIndex = 1;
    plugins = with pkgs; [
      {
        plugin = tmuxPlugins.catppuccin;
        extraConfig = ''
          set -g @catppuccin_flavour "macchiato"
        '';
      }
      {
        plugin = tmuxPlugins.continuum;
        extraConfig = ''
          set -g @continuum-restore 'on'
          set -g @continuum-save-interval '30' # minutes
        '';
      }
      {
        plugin = tmuxPlugins.resurrect;
        extraConfig = ''
          set -g @resurrect-strategy-nvim 'session'
          set -g @resurrect-capture-pane-contents 'on'
        '';
      }
      tmuxPlugins.yank
      tmuxPlugins.vim-tmux-navigator
    ];
    extraConfig = ''
      # https://stackoverflow.com/questions/41783367/tmux-tmux-true-color-is-not-working-properly/41786092#41786092
      set-option -sa terminal-overrides ",xterm*:Tc"

      # resize like vim
      bind -r h resize-pane -L 5
      bind -r j resize-pane -D 5
      bind -r k resize-pane -U 5
      bind -r l resize-pane -R 5

      # maximize pane
      bind -r m resize-pane -Z

      # select and copy like in vim
      bind-key -T copy-mode-vi 'v' send -X begin-selection
      bind-key -T copy-mode-vi 'y' send -X copy-selection

      unbind -T copy-mode-vi MouseDragEnd1Pane
    '';
  };
}
