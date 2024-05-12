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
      flags = [
        "--disable-up-arrow"
      ];
    };

    thefuck = {
      enable = true;
    };

    yazi = {
      enable = true;
    };

    zoxide = {
      enable = true;
      options = [
        "--cmd cd"
      ];
    };

    direnv = {
      enable = true;
      nix-direnv.enable = true;
    };

    ripgrep = {
      enable = true;
    };
  };
}
