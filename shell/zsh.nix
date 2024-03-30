{ config, ... }:
{
  programs.zsh = {
    enable = true;
    shellAliases = {
      #sudo = "sudo -E -s ";
      #ls = "eza";
      #ls = "lsd";
      #ll = "ls -l";
      #la = "ls -la";
      cat  = "bat --paging=never";
      less = "bat --paging=always";
      vim = "nvim";
      update = ''bash -c "sudo nixos-rebuild switch"'';
      update-channel = ''bash -c "sudo nix-channel --update"'';
      home = "home-manager switch";
      #rm-gtk-settings = "rm ~/.config/gtk-4.0/settings.ini ~/.config/gtk-3.0/settings.ini";
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

      #eval "$(thefuck --alias)"
      #eval "$(direnv hook zsh)"
      #eval "$(zoxide init --cmd cd zsh)"
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
}
