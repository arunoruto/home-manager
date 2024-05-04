{ pkgs, ... }:
let
  flavour = "macchiato";
  catppuccin-bat = builtins.fetchGit {
    url = "https://github.com/catppuccin/bat";
    ref = "main";
  };
in
{
  # Bash
  programs.bash.initExtra = ''eval "$(direnv hook bash)"'';

  # lsd is an ls replacement
  programs.lsd = {
    enable = true;
    enableAliases = true;
  };

  programs.fzf = {
    enable = true;
    enableZshIntegration = true;
  };

  #programs.fd = {
  #  enable = true;
  #};

  # bat
  programs.bat = {
    enable = true;
    config = {
      #paging = "never";
      #style = "plain";
      theme = "Monokai Extended";
      #themes = "${catppuccin_bat}/Catppuccin-macchiato.tmTheme";
    };
    extraPackages = with pkgs.bat-extras; [ batdiff batman batgrep batwatch ];
  };
  home.file.".config/bat/themes/catppuccin" = {
      recursive = true;
      source = "${catppuccin-bat}";
    };

  programs.atuin = {
    enable = true;
    enableZshIntegration = true;
    flags = [
      "--disable-up-arrow"
    ];
  };

  programs.thefuck = {
    enable = true;
    enableZshIntegration = true;
  };

  programs.yazi = {
    enable = true;
    enableZshIntegration = true;
  };

  programs.zoxide = {
    enable = true;
    enableZshIntegration = true;
    options = [
      "--cmd cd"
    ];
  };

  programs.direnv = {
    enable = true;
    enableZshIntegration = true;
    nix-direnv.enable = true;
  };


  programs.ripgrep = {
    enable = true;
  };
}
