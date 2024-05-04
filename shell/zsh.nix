{ config, ... }:
{
  programs.zsh = {
    enable = true;
    dotDir = ".config/zsh";
    shellAliases = {
      #sudo = "sudo -E -s ";
      #ls = "eza";
      #ls = "lsd";
      #ll = "ls -l";
      #la = "ls -la";
      cat  = "bat --paging=never";
      less = "bat --paging=always";
      grep = "rg";
      #vim = "nvim";
      update = ''bash -c "sudo nixos-rebuild switch"'';
      update-channel = ''bash -c "sudo nix-channel --update"'';
      home = "home-manager switch";
      #rm-gtk-settings = "rm ~/.config/gtk-4.0/settings.ini ~/.config/gtk-3.0/settings.ini";
      tss  = "tailscale switch $(tailscale switch --list | tail -n +2 | fzf | tr -s ' ' | cut -d' ' -f1)";
      #tsen = "tailscale status | grep 'offers exit node' | fzf | tr -s ' ' | cut -d' ' -f2";
    };
    sessionVariables = {
      PATH = "$HOME/.bin:$PATH";
      TEST = "1234";

      #FZF_DEFAULT_COMMAND = "fd --hidden --strip-cwd-prefix --exclude .git";
      #FZF_CTRL_T_COMMAND = "$FZF_DEFAULT_COMMAND";
      #FZF_ALT_C_COMMAND = "fd --type=d --hidden --strip-cwd-prefix --exclude .git";
      FZF_DEFAULT_OPTS=''
        --color=bg+:#363a4f,bg:#24273a,spinner:#f4dbd6,hl:#ed8796 \
        --color=fg:#cad3f5,header:#ed8796,info:#c6a0f6,pointer:#f4dbd6 \
        --color=marker:#f4dbd6,fg+:#cad3f5,prompt:#c6a0f6,hl+:#ed8796
      '';

      FZF_CTRL_T_OPTIONS = "--prview 'bat -n --color=always --line-range :500 {}'";
      FZF_ALT_C_OPTIONS = "--prview 'eza --tree --color=always {} | head -200'";
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

      _fzf_comprun() {
        local command=$1
        shift

        case "$command" in
          cd)           fzf --preview 'eza --tree --level=2 --color=always {} | head -200' "$@" ;;
          export|unset) fzf --preview "'eval 'echo \$' {}" "$@" ;;
          ssh)          fzf --preview 'dig {}' "$@" ;;
          *)            fzf --preview "--preview 'bat -n --color=always --line-range :500 {}'" "$@" ;;
        esac
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
