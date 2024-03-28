{ config, pkgs, ... }:
let
  flavour = "macchiato";
  catppuccin-bat = builtins.fetchGit {
    url = "https://github.com/catppuccin/bat";
    ref = "main";
  };
  #catppuccin_bat = {
  #  src = pkgs.fetchFromGitHub {
  #    owner = "catppuccin";
  #    repo = "bat"; # Bat uses sublime syntax for its themes
  #    rev = "main";
  #    #sha256 = "019hfl4zbn4vm4154hh3bwk6hm7bdxbr1hdww83nabxwjn99ndhv";
  #  };
  #  file = "Catppuccin-${flavour}.tmTheme";
  #};
in
{
  programs.starship = {
    enable = true;
    # Configuration written to ~/.config/starship.toml
    settings = {
      # add_newline = false;

      character = {
        success_symbol = "[➜](bold green)";
        error_symbol = "[➜](bold red)";
      };

      # package.disabled = true;
      palette = "catppuccin_${flavour}";
    } // builtins.fromTOML (builtins.readFile
      (pkgs.fetchFromGitHub
        {
          owner = "catppuccin";
          repo = "starship";
          rev = "5629d2356f62a9f2f8efad3ff37476c19969bd4f"; # Replace with the latest commit hash
          sha256 = "sha256-nsRuxQFKbQkyEI4TXgvAjcroVdG+heKX5Pauq/4Ota0=";
        } + /palettes/${flavour}.toml));
  };

  # ZSH
  programs.zsh = {
    enable = true;
    shellAliases = {
      #sudo = "sudo -E -s ";
      #ls = "eza";
      ls = "lsd";
      ll = "ls -l";
      la = "ls -la";
      cat  = "bat --paging=never";
      less = "bat --paging=always";
      vim = "nvim";
      update = ''bash -c "sudo nixos-rebuild switch"'';
      update-channel = ''bash -c "sudo nix-channel --update"'';
      home = "home-manager switch";
      rm-gtk-settings = "rm ~/.config/gtk-4.0/settings.ini ~/.config/gtk-3.0/settings.ini";
    };
    sessionVariables = {
      PATH = "$HOME/.bin:$PATH";
      TEST = "1234";
    };
    history = {
      size = 10000;
      path = "${config.xdg.dataHome}/zsh/history";
    };
    #autosuggestion.enable = true;
    enableAutosuggestions = true;
    enableCompletion = true;

    initExtra = ''
      bindkey "^[[1;5C" forward-word
      bindkey "^[[1;5D" backward-word

      function get-pr-override() {
        PR_NO=$1
        HASH=$(curl -sL https://github.com/NixOS/nixpkgs/pull/''${PR_NO}.patch \
              | head -n 1 | grep -o -E -e "[0-9a-f]{40}")
        echo pr''${PR_NO} = "import (fetchTarball"
        echo "  \"\''${nixpkgs-tars}''${HASH}.tar.gz\")"
        echo "    { config = config.nixpkgs.config; };"
      }

      eval "$(thefuck --alias)"
      eval "$(direnv hook zsh)"
      eval "$(zoxide init --cmd cd zsh)"
    '';
    #antidote = {
    #  enable = true;
    #  plugins = [
    #    "zsh-users/zsh-autosuggestions"
    #    "zsh-users/zsh-syntax-highlighting"
    #  ];
    #};
    oh-my-zsh = {
      enable = true;
    #  theme = "robbyrussell";
    #  plugins = [
    #  	"git"
    #    "thefuck"
    #    "docker"
    #  ];
    };
    plugins = [
      {
        name = "zsh-autosuggestions";
        src = builtins.fetchGit {
          url = "https://github.com/zsh-users/zsh-autosuggestions";
          ref = "master";
        };
      }
    ];
  };

  # Bash
  programs.bash.initExtra = ''eval "$(direnv hook bash)"'';

  # bat
  programs.bat = {
    enable = true;
    config = {
      #paging = "never";
      #style = "plain";
      theme = "Monokai Extended";
      #themes = "${catppuccin_bat}/Catppuccin-macchiato.tmTheme";
    };
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
}
