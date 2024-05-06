{config, ...}: {
  programs.zsh = {
    enable = true;
    dotDir = ".config/zsh";
    shellAliases = {
      #sudo = "sudo -E -s ";
      #ls = "eza";
      #ls = "lsd";
      #ll = "ls -l";
      #la = "ls -la";
      grep = "rg";
      #vim = "nvim";
      update = ''bash -c "sudo nixos-rebuild switch"'';
      update-channel = ''bash -c "sudo nix-channel --update"'';
      home = "home-manager switch";
      #rm-gtk-settings = "rm ~/.config/gtk-4.0/settings.ini ~/.config/gtk-3.0/settings.ini";
      tss = "tailscale switch $(tailscale switch --list | tail -n +2 | fzf | tr -s ' ' | cut -d' ' -f1)";
      tsr = ''bash -c "sudo systemctl restart tailscaled.service"'';
      #tsen = "tailscale status | grep 'offers exit node' | fzf | tr -s ' ' | cut -d' ' -f2";
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

      export LS_COLORS="$(vivid generate catppuccin-macchiato)";
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
