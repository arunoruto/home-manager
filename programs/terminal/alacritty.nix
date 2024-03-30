{ pkgs, ... }:
let
  catppuccin-alacritty = builtins.fetchGit {
    url = "https://github.com/catppuccin/alacritty";
    ref = "refs/tags/yaml";
  };
in
{
  programs.alacritty = {
    enable = true;
    settings = {
      import = [
        "~/.config/alacritty/catppuccin/catppuccin-macchiato.yml"
      ];
      shell = {
        program = "zsh";
        #args = [
        #  "-l"
        #  "-c"
        #  "tmux attach || tmux"
        #];
      };
      window = {
        decorations = "full";
	      dimensions = {
	        columns = 108;
	        lines = 36;
	      };
        opacity = 1;
      };
      font = {
        size = 12;
        offset = {
          y = 0;
          x = 0;
        };
        glyph_offset = {
          y = 0;
          x = 0;
        };
        bold = {
          style  = "Bold";
          family = "FiraCode Nerd Font";
        };
        normal = {
          style  = "Regular";
          family = "FiraCode Nerd Font";
        };
      };
    };
  };

  # Theme for alacritty
  home.file.".config/alacritty/catppuccin/catppuccin-macchiato.yml".source = "${catppuccin-alacritty}/catppuccin-macchiato.yml";
}
