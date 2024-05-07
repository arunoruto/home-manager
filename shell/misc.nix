{pkgs, ...}: {
  programs = {
    # Bash
    bash.initExtra = ''eval "$(direnv hook bash)"'';

    # lsd is an ls replacement
    lsd = {
      enable = true;
      enableAliases = true;
      settings = {
        ignore-globs = [
          ".DS_Store"
        ];
        sorting = {
          dir-grouping = "first";
        };
      };
    };

    #fd = {
    #  enable = true;
    #};

    atuin = {
      enable = true;
      enableZshIntegration = true;
      flags = [
        "--disable-up-arrow"
      ];
    };

    thefuck = {
      enable = true;
      enableZshIntegration = true;
    };

    yazi = {
      enable = true;
      enableZshIntegration = true;
    };

    zoxide = {
      enable = true;
      enableZshIntegration = true;
      options = [
        "--cmd cd"
      ];
    };

    direnv = {
      enable = true;
      enableZshIntegration = true;
      nix-direnv.enable = true;
    };

    ripgrep = {
      enable = true;
    };
  };
}
