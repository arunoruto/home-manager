{ config, pkgs, lib, ... }:
{
  nixpkgs = {
    config = {
      allowUnfree = true;
    };
  };
  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;

  imports = [
    #./user.nix
    ./shell.nix
    ./programs/vim.nix
    ./programs/git.nix
    #./programs/octave.nix
    ./programs/python.nix
    ./programs/terminal.nix
    ./programs/steam.nix

    ./gnome/theming.nix
    ./gnome/dconf.nix
    ./sway/main.nix
  ];
  # Home Manager needs a bit of information about you and the paths it should
  # manage.
  #home.username = "mirza";
  #home.homeDirectory = "/home/mirza";
  home.username = builtins.getEnv "USER";
  home.homeDirectory = builtins.getEnv "HOME";

  # This value determines the Home Manager release that your configuration is
  # compatible with. This helps avoid breakage when a new Home Manager release
  # introduces backwards incompatible changes.
  #
  # You should not change this value, even if you update Home Manager. If you do
  # want to update the value, then make sure to first check the Home Manager
  # release notes.
  home.stateVersion = "23.05"; # Please read the comment before changing.

  # The home.packages option allows you to install Nix packages into your
  # environment.
  home.packages = with pkgs; 
    let
      RStudio-with-my-packages = rstudioWrapper.override{ packages = with rPackages; [
        ggplot2 dplyr xts rstan hBayesDM
      ];};
    in
  [
    #breitbandmessung
    #foliate
    gimp
    inkscape
    jabref
    julia
    #obsidian
    #octaveFull
    #octavePackages.image
    #okular
    rnote
    speedtest-cli
    spotify
    telegram-desktop
    #ultrastardx
    #via
    #vial
    #qbittorrent
    youtube-dl

    exercism
    fzf
    hugo
    julia
    thefuck
    yazi
    zoxide

    gnomeExtensions.appindicator
    gnomeExtensions.emoji-selector
    gnomeExtensions.focus
    gnomeExtensions.tailscale-status
    gnomeExtensions.transparent-top-bar

    #(nerdfonts.override { fonts = [ "FiraCode" ]; })

    (writeShellScriptBin "my-hello" ''
      echo "Hello, ${config.home.username}!"
    '')

    zsh-autosuggestions
    zsh-syntax-highlighting
  ];

  ## Fonts
  #fonts.fonts = with pkgs; [
  #  aileron # helvetica
  #  liberation_ttf # Times New Roman, Arial, and Courier New
  #  (nerdfonts.override { fonts = [ "FiraCode" ]; })
  #];


  # Home Manager is pretty good at managing dotfiles. The primary way to manage
  # plain files is through 'home.file'.
  home.file = {
    # # Building this configuration will create a copy of 'dotfiles/screenrc' in
    # # the Nix store. Activating the configuration will then make '~/.screenrc' a
    # # symlink to the Nix store copy.
    # ".screenrc".source = dotfiles/screenrc;

    # # You can also set the file content immediately.
    # ".gradle/gradle.properties".text = ''
    #   org.gradle.console=verbose
    #   org.gradle.daemon.idletimeout=3600000
    # '';

    ".config/chrome-flags.conf".text = ''
      --enable-features=TouchpadOverscrollHistoryNavigation
      --enable-gpu-rasterization
      --ignore-gpu-blacklist
      --disable-gpu-driver-workarounds
    '';
  };
  
  programs.ssh = {
    enable = true;
    extraConfig = ''
      Host kyuubi.tail
          HostName kyuubi
          User mar
          ForwardX11 yes
      Host ultron.tail
          Hostname ultron
          User mar
          ForwardX11 yes
      Host jabba.tail
          Hostname jabba
          User mar
          ForwardX11 yes
    '';
  };

  # You can also manage environment variables but you will have to manually
  # source
  #
  #  ~/.nix-profile/etc/profile.d/hm-session-vars.sh
  #
  # or
  #
  #  /etc/profiles/per-user/mar/etc/profile.d/hm-session-vars.sh
  #
  # if you don't want to manage your shell through Home Manager.
  home.sessionVariables = {
    EDITOR = "nvim";
    WINIT_UNIX_BACKEND = "x11";
  };

}
