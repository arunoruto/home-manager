{config, ...}: let
  zsh-sh-catppuccin = "";
  #zsh-sh-catppuccin = builtins.fetchGit {
  #  url = "https://github.com/catppuccin/zsh-syntax-highlighting";
  #  ref = "main";
  #};
in {
  programs = {
    zsh = {
      enable = true;
      dotDir = ".config/zsh";
      shellAliases = {
        grep = "rg";
        update = ''bash -c "sudo nixos-rebuild switch"'';
        update-channel = ''bash -c "sudo nix-channel --update"'';
        home = "home-manager switch";
        tss = "tailscale switch $(tailscale switch --list | tail -n +2 | fzf | tr -s ' ' | cut -d ' ' -f1)";
        tsr = ''bash -c "sudo systemctl restart tailscaled.service"'';
        #tsen = "tailscale status | grep 'offers exit node' | fzf | tr -s ' ' | cut -d' ' -f2";
      };
      sessionVariables = {
        XAUTHORITY = "$HOME/.Xauthority";
        PATH = "$HOME/.bin:$PATH";
        TEST = "1234";
      };
      history = {
        size = 10000;
        path = "${config.xdg.dataHome}/zsh/history";
      };
      #autosuggestion.enable = true;
      enableAutosuggestions = false;
      enableCompletion = false;

      initExtra = ''
        # Disable all sounds
        unsetopt BEEP

        # Enable autocomplete for . and ..
        zstyle ':completion:*' special-dirs true
        zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'
        zstyle ':completion:*' list-colors "''${(s.:.)LS_COLORS}"

        # bindkey "^[[1;5C" forward-word
        # bindkey "^[[1;5D" backward-word

        function get-pr-override() {
          PR_NO=$1
          HASH=$(curl -sL https://github.com/NixOS/nixpkgs/pull/''${PR_NO}.patch \
                | head -n 1 | grep -o -E -e "[0-9a-f]{40}")
          echo pr''${PR_NO} = "import (fetchTarball"
          echo "  \"\''${nixpkgs-tars}''${HASH}.tar.gz\")"
          echo "    { config = config.nixpkgs.config; };"
        }

        export LS_COLORS="$(vivid generate catppuccin-macchiato)";

        eval "tailscale completion zsh &> ~/.config/zsh/_tailscale"
        source ~/.config/zsh/_tailscale

        #source ${zsh-sh-catppuccin}/themes/catppuccin_macchiato-zsh-syntax-highlighting.zsh
      '';
      antidote = {
        enable = true;
        plugins = [
          "zsh-users/zsh-autosuggestions"
          "zsh-users/zsh-completions"
          "zsh-users/zsh-syntax-highlighting"
        ];
      };
      # oh-my-zsh = {
      #   enable = true;
      #   #  theme = "robbyrussell";
      #   #  plugins = [
      #   #  	"git"
      #   #    "thefuck"
      #   #    "docker"
      #   #  ];
      # };
      # plugins = [
      #   {
      #     name = "zsh-autosuggestions";
      #     src = builtins.fetchGit {
      #       url = "https://github.com/zsh-users/zsh-autosuggestions";
      #       ref = "master";
      #     };
      #   }
      # ];
    };
    starship.enableZshIntegration = true;
    zoxide.enableZshIntegration = true;
    fzf.enableZshIntegration = true;
    atuin.enableZshIntegration = true;
    thefuck.enableZshIntegration = true;
    yazi.enableZshIntegration = true;
    direnv.enableZshIntegration = true;
  };
}
